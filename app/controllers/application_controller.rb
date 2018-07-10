# frozen_string_literal: true

class ApplicationController < ActionController::Base
  http_basic_authenticate_with(
    name: Rails.configuration.x.basic_auth_user,
    password: Rails.configuration.x.basic_auth_password)
end
