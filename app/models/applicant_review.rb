# frozen_string_literal: true

class ApplicantReview < Review
  RATINGS_DATA_FIELDS = {
    response_quality_rating: :float,
    response_time_rating: :float,
    application_process_rating: :float,
    interview_professionality_rating: :float,
    information_completeness_rating: :float,
    interview_mood_rating: :float,
    applicant_threatment_rating: :float,
    answer_quality_rating: :float,
    further_steps_rating: :float,
    timely_interview_result_rating: :float
  }.freeze
  
  jsonb_accessor :ratings_data, RATINGS_DATA_FIELDS

  jsonb_accessor :user_content_data,
    company_name: :string,
    city: :string,
    position: :string,
    application_year: :string,
    result: :string

  def url
    "#{company.url}/b/#{foreign_id}"
  end
end
