# frozen_string_literal: true

class EmployeeReview < Review
  RATINGS_DATA_FIELDS = {
    social_rating: :float,
    work_life_rating: :float,
    image_rating: :float,
    work_environment_rating: :float,
    supervisor_behavior_rating: :float,
    colleague_behavior_rating: :float,
    interesting_tasks_rating: :float,
    communication_rating: :float,
    equality_rating: :float,
    elder_colleagues_rating: :float,
    career_rating: :float,
    salary_rating: :float,
    working_conditions_rating: :float
  }.freeze

  jsonb_accessor :ratings_data, RATINGS_DATA_FIELDS

  jsonb_accessor :user_content_data,
    company_name: :string,
    city: :string,
    job_state: :string,
    position: :string,
    department: :string

  def url
    "#{company.url}/a/#{foreign_id}"
  end

  def self.display_type
    'Employee'
  end
end
