# frozen_string_literal: true

module DashboardsHelper
  def render_daily_avg_review_rating(company)
    data_sets = [
      { name: 'happiness rating', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_employee_review_avg_happiness_rating') },
      { name: 'total rating', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_employee_review_avg_review_rating') }
    ]

    line_chart(data_sets, min: 0, max: 5)
  end

  def render_daily_avg_review_count(company)
    line_chart([{ name: 'total rating count', data: DataSet.chart_data_for(company, 'daily_avg_review_count', 'daily_employee_review_avg_review_count') }])
  end
end
