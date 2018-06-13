class CreateInitialTables < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    create_table :snapshots do |t|
      t.integer :employee_rating_count
      t.float :employee_rating_avg
      t.integer :applicant_rating_count
      t.float :applicant_rating_avg
      t.integer :trainee_rating_count
      t.float :trainee_rating_avg
      t.integer :recomendation_rate
      t.integer :visits_count
      t.integer :employer_comments_count
      t.integer :reviews_count
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
