namespace :reviews do
  desc "Imports reviews for all companies."
  task :import => :environment do
    Company.find_each do |company|
      imported = ImportReviews.new(company).call

      Rails.logger.info "#{company.name}: #{imported} reviews imported."

      if imported.positive?
        company.data_sets.update_all(outdated: true)

        Rails.logger.info "#{company.name}: Building up chart cache."
        CalculateChartData.new(company).call
        
        Rails.logger.info "#{company.name}: Removing old chart cache."
        company.data_sets.outdated.destroy_all
      end
    end
  end
end
