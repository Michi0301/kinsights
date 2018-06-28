# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EmployeeReview, type: :model do
  subject { FactoryBot.build(:employee_review) }

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:foreign_id).case_insensitive }

    it { is_expected.to validate_presence_of(:foreign_id) }
    it { is_expected.to validate_presence_of(:total_rating) }
  end

  describe '#url' do
    it { expect(subject.url).to eq("https://www.example.com/de/acme-inc/a/#{subject.foreign_id}") }
  end
end
