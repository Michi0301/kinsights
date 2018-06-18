class Company < ApplicationRecord
  validates :name, :url, presence: true

  has_many :snapshots, inverse_of: :company, dependent: :destroy

  def comments_url
    "#{url}/kommentare"
  end
end
