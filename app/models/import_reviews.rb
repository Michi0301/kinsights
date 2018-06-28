# frozen_string_literal: true

class ImportReviews
  def initialize(company)
    @company = company
  end

  def call
    import_reviews
  end

  private

  attr_reader :company

  def import_reviews(page = 1, imported = 0, type = 'EmployeeReview')
    document = Nokogiri::HTML(Request.new(company.comments_url(page)).get)

    document.css('article[itemprop=review]').each do |review_doc|
      review = company.reviews.build(type: type)

      assign_review_stats(review_doc, review)

      review_doc.css('div.review-details.user-content li').each do |user_content_doc|
        assign_user_content(user_content_doc, review, type)
      end

      review_doc.css('div.rating-group').each do |rating_doc|
        assign_ratings(rating_doc, review, type)
      end

      # Stop import as soon as one known review appears
      return imported if Review.exists?(foreign_id: review.foreign_id)

      review.save!
      imported += 1
    end

    return imported unless document.css('div.paginationControl').present?

    import_reviews(page + 1, imported)
  end

  def assign_review_stats(review_doc, review_record)
    review_record.total_rating = Parsers::CommaFloat.new(review_doc.css('div.tile-rating div.tile-heading').text).parse
    review_record.publish_date = review_doc.css('meta[itemprop=dateCreated]')[0]['content'].strip
    review_record.foreign_id = review_doc.css('div.mobile-review-title h1.review-title a')[0]['href'].strip.split('/').last
  end

  def assign_user_content(user_content_doc, review_record, type)
    user_content_key = user_content_doc.css('div.text-sm.text-gray-base-70.text-light.text-uppercase').text.strip
    user_content_value = user_content_doc.css('div.text-semibold').text.strip

    mapping = "ReviewMapping::#{type}::UserContent::MAPPING".constantize

    user_content_attribute = mapping[user_content_key]
    review_record.assign_attributes(user_content_attribute => user_content_value)
  end

  def assign_ratings(rating_doc, review_record, type)
    review_score_key = rating_doc.css('span.rating-title').text.strip
    review_score_value = Parsers::CommaFloat.new(rating_doc.css('span.rating-badge').text).parse

    mapping = "ReviewMapping::#{type}::Scores::MAPPING".constantize
    review_score_attribute = mapping[review_score_key]
    review_record.assign_attributes(review_score_attribute => review_score_value)
  end
end
