# frozen_string_literal: true

module ImportReviews
  class Importer
    def initialize(company, review_class)
      @company = company
      @review_class = review_class
    end

    def call
      import_reviews
    end

    private

    attr_reader :company, :review_class

    def import_reviews(page = 1, imported = 0)
      html_body = Request.new(company.send(url_for(review_class), page)).get
      parsed_html = Nokogiri::HTML(html_body)

      parsed_html.css('article[itemprop=review]').each do |review_article|
        review = review_class.new(company_id: company.id)

        ImportReviews::AssignReviewAttrs.new(review_article, review).call

        review_article.css('div.review-details.user-content li').each do |user_content_doc|
          ImportReviews::AssignUserContent.new(user_content_doc, review, review_class).call
        end

        review_article.css('div.rating-group').each do |rating_doc|
          ImportReviews::AssignUserRatings.new(rating_doc, review, review_class).call
        end

        # Stop import as soon as one known review appears
        return imported if Review.exists?(foreign_id: review.foreign_id)

        review.save!
        imported += 1
      end

      return imported unless parsed_html.css('div.paginationControl').present?

      import_reviews(page + 1, imported)
    end

    def url_for(review_class)
      return :comments_url if review_class == EmployeeReview
      return :applicants_url if review_class == ApplicantReview

      raise 'Review class not supported!'
    end
  end
end
