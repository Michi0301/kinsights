class Company < ApplicationRecord
  validates :name, :url, presence: true

  has_many :snapshots, inverse_of: :company, dependent: :destroy
  has_many :reviews, inverse_of: :company, dependent: :destroy
  has_many :charts

  def comments_url(page=1)
    "#{url}/kommentare/#{page}"
  end
end
