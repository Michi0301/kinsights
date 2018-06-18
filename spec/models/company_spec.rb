require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { FactoryBot.build(:company) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_presence_of(:name) }
  end

  describe '#comments_url' do
    it { expect(subject.comments_url).to eq('https://www.example.com/de/acme-inc/kommentare') }
  end
end
