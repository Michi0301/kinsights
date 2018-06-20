namespace :reviews do
  desc "Imports reviews for all companies."
  task :import => :environment do
    Company.find_each do |company|
      ImportReviews.new(company, '_').call
    end
  end
end
