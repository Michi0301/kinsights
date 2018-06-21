require 'rails_helper'

RSpec.describe ImportReviews, type: :model do
  subject { described_class.new(company, _last_review_date).call }

  describe '#call' do
    let(:company) { FactoryBot.create(:company, url: 'https://test.de/de/my-company')}
    let(:_last_review_date) { }

    before do
      stub_request(:get, 'https://test.de/de/my-company/kommentare/1')
      .with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
        })
        .to_return(status: 200, body: File.open(Rails.root.join('spec/fixtures/review_stats_page_1.html')))

        stub_request(:get, 'https://test.de/de/my-company/kommentare/2')
        .with(
          headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'User-Agent'=>'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36'
          })
          .to_return(status: 200, body: File.open(Rails.root.join('spec/fixtures/review_stats_page_2.html')))
    end

    context 'full import' do
      it 'imports all reviews' do
        expect{ subject }.to change(Review, :count).by(20)
      end

      it 'assigns correct values' do
        subject

        expect(Review.first).to have_attributes(
          total_rating: 4.77,
          publish_date: Date.parse('2018-05-23'),
          foreign_id: 'SkdhVVN2fw%3D%3D',
          social_rating: 5.0,
          work_life_rating: 5.0,
          image_rating: 4.0,
          work_environment_rating: 5.0,
          supervisor_behavior_rating: 5.0,
          colleague_behavior_rating: 5.0,
          interesting_tasks_rating: 5.0,
          communication_rating: 5.0,
          equality_rating: 5.0,
          elder_colleagues_rating: 4.0,
          career_rating: 5.0,
          salary_rating: 4.0,
          working_conditions_rating: 5.0,
          company_name: 'baz Germany GmbH',
          city: 'Berlin',
          job_state: 'Aktueller Job',
          position: 'Management / Führungskraft',
          department: 'Vertrieb / Verkauf',
        )
      end
    end

    context 'partial import' do
      before do
        FactoryBot.create(:review,
          company: company,
          total_rating: 4.77,
          publish_date: "2018-05-23",
          foreign_id: 'SkduV1h1ew%3D%3D',
          social_rating: 5.0,
          work_life_rating: 5.0,
          image_rating: 4.0,
          work_environment_rating: 5.0,
          supervisor_behavior_rating: 5.0,
          colleague_behavior_rating: 5.0,
          interesting_tasks_rating: 5.0,
          communication_rating: 5.0,
          equality_rating: 5.0,
          elder_colleagues_rating: 4.0,
          career_rating: 5.0,
          salary_rating: 4.0,
          working_conditions_rating: 5.0,
          company_name: 'baz Germany GmbH',
          city: 'Berlin',
          job_state: 'Aktueller Job',
          position: 'Management / Führungskraft',
          department: 'Vertrieb/ Verkauf')
      end

      it 'only imports unknown reviews' do
        expect{ subject }.to change(Review, :count).by(1)
      end
    end
  end
end
