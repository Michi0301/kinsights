# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, :url, presence: true

  has_many :reviews, inverse_of: :company, dependent: :destroy
  has_many :employee_reviews, inverse_of: :company, dependent: :destroy
  has_many :charts, dependent: :destroy
  has_many :data_sets, through: :charts

  def employee_comments_url(page = 1)
    "#{url}/kommentare/#{page}?sort=update_time_desc"
  end

  def applicant_comments_url(page = 1)
    "#{url}/bewerbung/#{page}?sort=update_time_desc"
  end

  def apprentice_comments_url(page = 1)
    "#{url}/ausbildungskommentare/#{page}?sort=update_time_desc"
  end

  def total_rating_trend(base=10)
    y_values = reviews.order(publish_date: :desc).limit(base).pluck(:total_rating)
    x_values = (1..y_values.size).to_a

    SimpleLinearRegression.new(x_values, y_values).slope.positive? ? :positive : :negative
  end

  def total_rating_average
    total_rating_average_for_last(reviews.count)
  end

  private

  def total_rating_average_for_last(number_of_reviews)
    reviews.last(number_of_reviews).pluck(:total_rating).sum / number_of_reviews
  end
end
