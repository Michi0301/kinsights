class Chart < ApplicationRecord
  belongs_to :company
  has_many :data_sets
end
