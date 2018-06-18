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
end
