class Company < ApplicationRecord
  validates :name, :url, presence: true

  has_many :reviews, inverse_of: :company, dependent: :destroy
  has_many :charts

  def comments_url(page=1)
    "#{url}/kommentare/#{page}"
  end

  def total_rating_trend
    trend_is_positive? ? :positive : :negative
  end

  def total_rating_average
    total_rating_average_for_last(reviews.count)
  end

  private

  def total_rating_average_for_last(n)
    reviews.last(n).pluck(:total_rating).sum / n
  end

  def trend_is_positive?
    total_rating_average_for_last(5) > total_rating_average
  end
end
