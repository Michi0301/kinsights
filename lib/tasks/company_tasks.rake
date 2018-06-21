namespace :reviews do
  desc "Imports reviews for all companies."
  task :import => :environment do
    Company.find_each do |company|
      imported = ImportReviews.new(company).call

      Rails.logger.info "#{company.name}: #{imported} reviews imported."
    end
  end
end
