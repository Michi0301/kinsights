# frozen_string_literal: true

namespace :reviews do
  desc 'Imports reviews for all companies.'
  task import: :environment do
    Company.find_each do |company|
      Review::REVIEW_TYPES.each do |review_class|
        imported_count = ImportReviews::Importer.new(company, review_class.constantize).call

        Rails.logger.info "#{company.name}: #{imported_count} #{review_class} imported."

        next unless imported_count.positive?
        company.data_sets.update_all(outdated: true)

        Rails.logger.info "#{company.name}: Building up chart cache."
        CalculateChartData.new(company).call

        Rails.logger.info "#{company.name}: Removing old chart cache."
        company.data_sets.outdated.destroy_all
      end
    end
  end
end
