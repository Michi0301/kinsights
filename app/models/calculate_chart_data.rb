class CalculateChartData
  def initialize(company)
    @company = company
  end

  def call
    start_date = Review.order(:publish_date).first.publish_date
    end_date = Review.order(:publish_date).last.publish_date

    calculate_daily_avg_review_count(company, start_date, end_date)
    calculate_daily_avg_review_rating(company, start_date, end_date)
  end

  private

  attr_reader :company, :chart, :start_date, :end_date
  
  def calculate_daily_avg_review_count(company, start_date, end_date)
    result = start_date.upto(end_date).map do |date|
      total_rating_avg_count = company.reviews.where(publish_date: start_date..date).count

      [date, total_rating_avg_count]
    end

    store_chart_data(company, result, 'daily_avg_review_count', 'daily_avg_review_count')

    result
  end

  def calculate_daily_avg_review_rating(company, start_date, end_date)
    result = start_date.upto(end_date).map do |date|
      reviews = company.reviews.where(publish_date: start_date..date)

      total_rating_avg = reviews.sum(:total_rating) / reviews.count

      [date, total_rating_avg]
    end

    store_chart_data(company, result, 'daily_avg_review_rating', 'daily_avg_review_rating')

    result
  end

  def store_chart_data(company, result, chart_type, dataset_type)
    chart = company.charts.find_or_create_by(chart_type: chart_type)
    dataset = chart.data_sets.create!(dataset_type: dataset_type, data: result)
  end
end