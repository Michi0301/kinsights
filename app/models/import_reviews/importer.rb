# frozen_string_literal: true
module ImportReviews
  class Importer
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

        ImportReviews::AssignReviewAttrs.new(review_doc, review).call

        review_doc.css('div.review-details.user-content li').each do |user_content_doc|
          ImportReviews::AssignUserContent.new(user_content_doc, review, type).call
        end

        review_doc.css('div.rating-group').each do |rating_doc|
          ImportReviews::AssignUserRatings.new(rating_doc, review, type).call
        end

        # Stop import as soon as one known review appears
        return imported if Review.exists?(foreign_id: review.foreign_id)

        review.save!
        imported += 1
      end

      return imported unless document.css('div.paginationControl').present?

      import_reviews(page + 1, imported)
    end
  end
end