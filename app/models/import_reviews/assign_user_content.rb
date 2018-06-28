module ImportReviews
  class AssignUserContent
    def initialize (user_content_doc, review_record, type)
    @user_content_doc = user_content_doc 
    @review_record = review_record 
    @type = type
    end

    def call
      assign_user_content(user_content_doc, review_record, type)
    end

    private

    attr_reader :user_content_doc, :review_record, :type

    def assign_user_content(user_content_doc, review_record, type)
      user_content_key = user_content_doc.css('div.text-sm.text-gray-base-70.text-light.text-uppercase').text.strip
      user_content_value = user_content_doc.css('div.text-semibold').text.strip

      mapping = "ReviewMapping::#{type}::UserContent::MAPPING".constantize

      user_content_attribute = mapping[user_content_key]
      review_record.assign_attributes(user_content_attribute => user_content_value)
    end
  end
end