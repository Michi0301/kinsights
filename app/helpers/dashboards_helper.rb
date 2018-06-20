module DashboardsHelper
  def render_rating_chart(company)
    line_chart [
      { name: 'employee rating avg', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.employee_rating_avg]} },
      { name: 'applicant rating avg', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.applicant_rating_avg]} },
      { name: 'trainee rating avg', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.trainee_rating_avg]} },
      { name: 'total rating avg', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.total_rating]} }
    ], min: 0, max: 5
  end

  def render_rating_count_chart(company)
    line_chart [
      { name: 'employee rating avg', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.employee_rating_count]} },
      { name: 'applicant rating count', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.applicant_rating_count]} },
      { name: 'trainee rating count', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.trainee_rating_count]} },
      { name: 'total rating count', data: company.snapshots.map { |s|  [ s.created_at.to_date, s.total_rating_count]} }
    ]
  end


  def calculate_daily_avg_review_rating(company, start_date, end_date)
    start_date.upto(end_date).map do |date|
      reviews = company.reviews.where(publish_date: start_date..date)

      total_rating_avg = reviews.sum(:total_rating) / reviews.count

      [date, total_rating_avg]
    end
  end

  def render_daily_avg_review_rating(company, start_date, end_date)
    line_chart [
      { name: 'total rating', data: calculate_daily_avg_review_rating(company, start_date, end_date) }
    ], min: 0, max: 5
  end

  def calculate_daily_avg_review_count(company, start_date, end_date)
    start_date.upto(end_date).map do |date|
      revtotal_rating_avg_count = company.reviews.where(publish_date: start_date..date).count

      [date, revtotal_rating_avg_count]
    end
  end

  def render_daily_avg_review_count(company, start_date, end_date)
    line_chart [
      { name: 'total rating count', data: calculate_daily_avg_review_count(company, start_date, end_date) }
    ]
  end
end
