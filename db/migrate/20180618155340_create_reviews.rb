class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :total_rating
      t.date :publish_date
      t.string :url
      t.float :social_rating
      t.float :work_life_rating
      t.float :image_rating
      t.float :work_environment_rating
      t.float :supervisor_behavior_rating
      t.float :colleague_behavior_rating
      t.float :interesting_tasks_rating
      t.float :communication_rating
      t.float :equality_rating
      t.float :elder_colleagues_rating
      t.float :career_rating
      t.float :salary_rating
      t.float :working_conditions_rating
      t.string :company_name
      t.string :city
      t.string :job_state
      t.string :position
      t.string :department
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
