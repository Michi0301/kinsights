FactoryBot.define do
  factory :review do
    total_rating 3
    association :company
  end
end