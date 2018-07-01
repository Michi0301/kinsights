# frozen_string_literal: true

class CalculateChartData
  def initialize(company)
    @company = company
  end

  def call
    Review::REVIEW_TYPES.dup.push('all').each do |type|
      calculate_daily_avg_review_count(company, type)
      calculate_daily_avg_review_rating(company, type)
      calculate_daily_avg_review_rating(company, type)
    end
  end

  private

  attr_reader :company, :chart

  def calculate_daily_avg_review_count(company, type)
    start_date = company.reviews.order(:publish_date).first.publish_date

    result = company.reviews.map do |review|
      if type == 'all'
        [review.publish_date, company.reviews.where(publish_date: start_date..review.publish_date).count]
      else
        [review.publish_date, company.reviews.where(type: type, publish_date: start_date..review.publish_date).count]
      end
    end

    store_chart_data(company, result, 'daily_avg_review_count', "daily_#{type.underscore}_avg_review_count")

    result
  end

  def calculate_daily_avg_review_rating(company, type)
    start_date = company.reviews.order(:publish_date).first.publish_date

    result = company.reviews.map do |review|
      reviews = if type == 'all'
        company.reviews.where(publish_date: start_date..review.publish_date)
      else
        company.reviews.where(type: type, publish_date: start_date..review.publish_date)
      end

      total_rating_avg = reviews.sum(:total_rating) / reviews.count

      [review.publish_date, total_rating_avg]
    end

    store_chart_data(company, result, 'daily_avg_review_rating', "daily_#{type.underscore}_avg_review_rating")

    result
  end

  def store_chart_data(company, result, chart_type, dataset_type)
    chart = company.charts.find_or_create_by(chart_type: chart_type)
    chart.data_sets.create!(dataset_type: dataset_type, data: result)
  end
end
