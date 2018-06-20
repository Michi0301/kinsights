module DashboardsHelper
  def calculate_daily_avg_review_rating(company, start_date, end_date)
    return chart_data(company, 'calculate_daily_avg_review_rating', 'calculate_daily_avg_review_rating') if chart_data_exists?(company, 'calculate_daily_avg_review_rating', 'calculate_daily_avg_review_rating')

    result = start_date.upto(end_date).map do |date|
      reviews = company.reviews.where(publish_date: start_date..date)

      total_rating_avg = reviews.sum(:total_rating) / reviews.count

      [date, total_rating_avg]
    end

    store_chart_data(company, result, 'calculate_daily_avg_review_rating', 'calculate_daily_avg_review_rating')

    result
  end

  def render_daily_avg_review_rating(company, start_date, end_date)
    line_chart [
      { name: 'total rating', data: calculate_daily_avg_review_rating(company, start_date, end_date) }
    ], min: 0, max: 5
  end

  def calculate_daily_avg_review_count(company, start_date, end_date)
    return chart_data(company, 'calculate_daily_avg_review_count', 'calculate_daily_avg_review_count') if chart_data_exists?(company, 'calculate_daily_avg_review_count', 'calculate_daily_avg_review_count')

    result = start_date.upto(end_date).map do |date|
      revtotal_rating_avg_count = company.reviews.where(publish_date: start_date..date).count

      [date, revtotal_rating_avg_count]
    end

    store_chart_data(company, result, 'calculate_daily_avg_review_count', 'calculate_daily_avg_review_count')

    result
  end

  def render_daily_avg_review_count(company, start_date, end_date)
    line_chart [
      { name: 'total rating count', data: calculate_daily_avg_review_count(company, start_date, end_date) }
    ]
  end

  def store_chart_data(company, result, chart_type, dataset_type)
    chart = company.charts.find_or_create_by(chart_type: chart_type)
    dataset = chart.data_sets.find_or_create_by(dataset_type: dataset_type).update_attributes!(data: result)
  end

  def chart_data(company, chart_type, dataset_type)
    DataSet.joins(chart: [:company]).where('charts.chart_type' => chart_type, 'data_sets.dataset_type' => dataset_type, 'companies.id' => company.id).first.data
  end

  def chart_data_exists?(company, chart_type, dataset_type)
    DataSet.joins(chart: [:company]).where('charts.chart_type' => chart_type, 'data_sets.dataset_type' => dataset_type, 'companies.id' => company.id).exists?
  end
end
