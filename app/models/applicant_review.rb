# frozen_string_literal: true

class ApplicantReview < Review
  def url
    "#{company.url}/b/#{foreign_id}"
  end
end
