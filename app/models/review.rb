class Review < ApplicationRecord
  belongs_to :company

  validates :foreign_id, uniqueness: true, case_sensitive: false
  validates :total_rating, :foreign_id, presence: true

  def url
    "#{company.url}/a/#{foreign_id}"
  end
end
