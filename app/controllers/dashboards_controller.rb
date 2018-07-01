# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    company = Company.find_by(name: params[:company])

    if company
      @companies = [company]
    else
      @companies = Company.order(:name)
    end
  end
end
