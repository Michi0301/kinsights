# frozen_string_literal: true

class AddTypeToReviews < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.string :type
    end
  end
end
