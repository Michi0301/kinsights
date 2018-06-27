module DashboardsHelper
  def render_daily_avg_review_rating(company)
    line_chart( 
      Review::REVIEW_TYPES.map { |type|      
        { name: 'total rating', data: DataSet.chart_data_for(company, 'daily_avg_review_rating', "daily_#{type.underscore}_avg_review_rating") }
      }, { min: 0, max: 5 }
    )
  end

  def render_daily_avg_review_count(company)
    line_chart( 
      Review::REVIEW_TYPES.map { |type|
        { name: 'total rating count', data: DataSet.chart_data_for(company, 'daily_avg_review_count', "daily_#{type.underscore}_avg_review_count") }
      }
    )
  end
end
