# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @companies = Company.order(:name)
  end
end
