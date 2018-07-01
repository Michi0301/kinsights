class ApprenticeReview < Review
  RATINGS_DATA_FIELDS = {
    instructor_rating: :float,
    fun_rating: :float,
    tasks_rating: :float,
    diversity_rating: :float,
    respect_rating: :float,
    career_rating: :float,
    working_atmosphere_rating: :float,
    salary_rating: :float,
    working_hours_rating: :float
  }

  jsonb_accessor :ratings_data, RATINGS_DATA_FIELDS

  jsonb_accessor :user_content_data,
    company_name: :string,
    city: :string,
    job_state: :string,
    department: :string

  def url
    "#{company.url}/c/#{foreign_id}"
  end
end
