# frozen_string_literal: true

module ImportReviews
  class AssignUserRatings
    def initialize(rating_doc, review_record, type)
      @rating_doc = rating_doc
      @review_record = review_record
      @type = type
    end

    def call
      assign_ratings(rating_doc, review_record, type)
    end

    private

    attr_reader :rating_doc, :review_record, :type

    def assign_ratings(rating_doc, review_record, type)
      review_score_key = rating_doc.css('span.rating-title').text.strip
      review_score_value = Parsers::CommaFloat.new(rating_doc.css('span.rating-badge').text).parse

      mapping = "ReviewMapping::#{type}::Scores::MAPPING".constantize
      review_score_attribute = mapping[review_score_key]
      review_record.assign_attributes(review_score_attribute => review_score_value)
    end
  end
end
