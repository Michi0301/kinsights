class AddForeignIdToReviews < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.remove :url
      t.column :foreign_id, :string, null: false
    end

    add_index :reviews, :foreign_id
  end
end
