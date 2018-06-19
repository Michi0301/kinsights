class ImportReviews
  def initialize(company, last_review_date)
    @company = company
    @last_review_date = last_review_date
  end

  def call
    import_reviews
  end

  private

  attr_reader :company

  def import_reviews(page=0)
    document = Nokogiri::HTML(Request.new(company.comments_url(page)).get)

    document.css('article[itemprop=review]').each do |review_doc|
      review = company.reviews.build

      assign_review_stats(review_doc, review)

      review_doc.css('div.review-details.user-content li').each do |user_content_doc|
        assign_user_content(user_content_doc, review)
      end

      review_doc.css('div.rating-group').each do |rating_doc|
        assign_ratings(rating_doc, review)
      end

      review.save!
    end

    return unless document.css('div.paginationControl').present?

    import_reviews(page + 1)
  end

  def assign_review_stats(review_doc, review_record)
    review_record.total_rating = Parsers::CommaFloat.new(review_doc.css('div.tile-rating div.tile-heading').text).parse
    review_record.publish_date = review_doc.css('meta[itemprop=dateCreated]')[0]['content'].strip
    review_record.url = review_doc.css('div.mobile-review-title h1.review-title a')[0]['href'].strip
  end

  def assign_user_content(user_content_doc, review_record)
    user_content_key = user_content_doc.css('div.text-sm.text-gray-base-70.text-light.text-uppercase').text.strip
    user_content_value =  user_content_doc.css('div.text-semibold').text.strip

    user_content_attribute = ReviewMapping::UserContent::MAPPING[user_content_key]
    review_record.assign_attributes(user_content_attribute => user_content_value)
  end

  def assign_ratings(rating_doc, review_record)
    review_score_key = rating_doc.css('span.rating-title').text.strip
    review_score_value = Parsers::CommaFloat.new(rating_doc.css('span.rating-badge').text).parse

    review_score_attribute = ReviewMapping::Scores::MAPPING[review_score_key]
    review_record.assign_attributes(review_score_attribute => review_score_value)
  end
end
