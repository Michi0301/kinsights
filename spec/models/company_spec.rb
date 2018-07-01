# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { FactoryBot.build(:company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#employee_comments_url' do
    it { expect(subject.employee_comments_url).to eq('https://www.example.com/de/acme-inc/kommentare/1?sort=update_time_desc') }
    it { expect(subject.employee_comments_url(5)).to eq('https://www.example.com/de/acme-inc/kommentare/5?sort=update_time_desc') }
  end

  describe '#trend' do
    context 'positive' do
      before do
        subject.save!
        10.times { FactoryBot.create(:employee_review, company: subject, total_rating: 3.0) }
        5.times  { FactoryBot.create(:employee_review, company: subject, total_rating: 4.0) }
      end

      it { expect(subject.total_rating_trend).to eq(:positive) }
    end

    context 'negative' do
      before do
        subject.save!
        10.times { FactoryBot.create(:employee_review, company: subject, total_rating: 3.0) }
        5.times  { FactoryBot.create(:employee_review, company: subject, total_rating: 2.0) }
      end

      it { expect(subject.total_rating_trend).to eq(:negative) }
    end
  end

  describe '#total_rating_average' do
    before do
      subject.save!
      10.times { FactoryBot.create(:employee_review, company: subject, total_rating: 3.0) }
    end

    it { expect(subject.total_rating_average).to eq(3.0) }
  end
end
