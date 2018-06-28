# frozen_string_literal: true

class AddOutdatedToDataSets < ActiveRecord::Migration[5.2]
  def change
    change_table :data_sets do |t|
      t.boolean :outdated, default: false, null: false
    end
  end
end
