module DashboardsHelper
  def render_daily_avg_review_rating(company, start_date, end_date)
    line_chart [
      { name: 'total rating', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_avg_review_rating') }
    ], min: 0, max: 5
  end

  def render_daily_avg_review_count(company, start_date, end_date)
    line_chart [
      { name: 'total rating count', data: DataSet.chart_data_for(company, 'daily_avg_review_count', 'daily_avg_review_count') }
    ]
  end
end
