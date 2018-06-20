class DashboardsController < ApplicationController
  def show
    @companies = Company.order(:name)
  end

  def reviews
    @companies = Company.order(:name)
    @start_date = Review.order(:publish_date).first.publish_date
    @end_date = Review.order(:publish_date).last.publish_date
  end
end
