# frozen_string_literal: true

FactoryBot.define do
  factory :employee_review do
    type 'EmployeeReview'
    total_rating 3.0
    association :company
    sequence(:foreign_id, &:to_s)
  end
end
