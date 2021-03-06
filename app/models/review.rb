# frozen_string_literal: true

class Review < ApplicationRecord
  REVIEW_TYPES = %w[EmployeeReview ApplicantReview ApprenticeReview].freeze
  belongs_to :company

  validates :foreign_id, uniqueness: true, case_sensitive: false
  validates :total_rating, :foreign_id, presence: true
end
