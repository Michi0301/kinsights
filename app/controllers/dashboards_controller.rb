class DashboardsController < ApplicationController
  def show
    @companies = Company.all
  end
end
