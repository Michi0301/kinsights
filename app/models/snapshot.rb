class Snapshot < ApplicationRecord
  belongs_to :company

  def total_rating
    ((employee_rating_count * employee_rating_avg +
      applicant_rating_count * applicant_rating_avg +
      trainee_rating_count * trainee_rating_avg)/
      (employee_rating_count + 
      applicant_rating_count + 
      trainee_rating_count)).round(2)
  end
end
