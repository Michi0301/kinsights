# frozen_string_literal: true

class Chart < ApplicationRecord
  belongs_to :company
  has_many :data_sets, dependent: :destroy
end
