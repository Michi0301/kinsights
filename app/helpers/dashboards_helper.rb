# frozen_string_literal: true

module DashboardsHelper
  def render_daily_avg_review_rating(company)
    data_sets = [
      { name: 'Total', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_all_avg_review_rating') },
      { name: 'Employee', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_employee_review_avg_review_rating') },
      { name: 'Applicant', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_applicant_review_avg_review_rating') },
      { name: 'Apprentice', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', 'daily_apprentice_review_avg_review_rating') }
    ]

    line_chart(data_sets, min: 0, max: 5, points: false, curve: false)
  end

  def render_daily_avg_review_count(company)
    area_chart([{ name: 'total rating count', data: DataSet.chart_data_for(company, 'daily_avg_review_count', 'daily_employee_review_avg_review_count') }], points: false)
  end

  def link_to_review(review)
    date = review.publish_date.strftime("%B %d, %Y")
    link_to "#{date} - #{review.class.display_type}: #{review.total_rating}", review.url, target: :_blank
  end
end
