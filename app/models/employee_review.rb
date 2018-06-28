# frozen_string_literal: true

class EmployeeReview < Review
  def url
    "#{company.url}/a/#{foreign_id}"
  end
end
