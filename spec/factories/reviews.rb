FactoryBot.define do
  factory :review do
    total_rating 3.0
    association :company
    sequence(:foreign_id) { |n| "#{n}" }
  end
end
