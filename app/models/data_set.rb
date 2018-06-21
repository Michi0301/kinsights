class DataSet < ApplicationRecord
  belongs_to :chart

  scope :outdated, ->{ where(outdated: true) }

  def self.chart_data_for(company, chart_type, dataset_type)
    joins(chart: [:company]).where('charts.chart_type' => chart_type, 'data_sets.dataset_type' => dataset_type, 'companies.id' => company.id).first.data
  end

  def self.chart_data_exists?(company, chart_type, dataset_type)
    joins(chart: [:company]).where('charts.chart_type' => chart_type, 'data_sets.dataset_type' => dataset_type, 'companies.id' => company.id).exists?
  end
end
