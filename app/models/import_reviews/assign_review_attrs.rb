module ImportReviews
  class AssignReviewAttrs
    def initialize(review_doc, review_record)
      @review_doc = review_doc
      @review_record = review_record
    end

    def call
      assign_review_attrs(review_doc, review_record)
    end

    private 

    attr_reader :review_doc, :review_record

    def assign_review_attrs(review_doc, review_record)
      review_record.total_rating = Parsers::CommaFloat.new(review_doc.css('div.tile-rating div.tile-heading').text).parse
      review_record.publish_date = review_doc.css('meta[itemprop=dateCreated]')[0]['content'].strip
      review_record.foreign_id = review_doc.css('div.mobile-review-title h1.review-title a')[0]['href'].strip.split('/').last
    end
  end
end