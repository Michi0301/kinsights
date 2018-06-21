class AddForeignIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :foreign_id, :string
    
    Review.find_each do |r|
      r.update_column(:foreign_id, r.read_attribute(:url).split('/').last)
    end
    
    remove_column :reviews, :url
    change_column :reviews, :foreign_id, :string, null: false
    add_index :reviews, :foreign_id
  end
end
