# frozen_string_literal: true

class DropSnapshots < ActiveRecord::Migration[5.2]
  def change
    drop_table :snapshots
  end
end
