class AddJsonBFieldToReviews < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.jsonb :ratings_data
      t.jsonb :user_content_data
    end

    remove_column :reviews, :response_quality_rating, :float
    remove_column :reviews, :response_time_rating, :float
    remove_column :reviews, :application_process_rating, :float
    remove_column :reviews, :interview_professionality_rating, :float
    remove_column :reviews, :information_completeness_rating, :float
    remove_column :reviews, :interview_mood_rating, :float
    remove_column :reviews, :applicant_threatment_rating, :float
    remove_column :reviews, :answer_quality_rating, :float
    remove_column :reviews, :further_steps_rating, :float
    remove_column :reviews, :timely_interview_result_rating, :float

    remove_column :reviews, :company_name, :string
    remove_column :reviews, :city, :string
    remove_column :reviews, :position, :string
    remove_column :reviews, :application_year, :string
    remove_column :reviews, :result, :string

    remove_column :reviews, :social_rating, :float
    remove_column :reviews, :work_life_rating, :float
    remove_column :reviews, :image_rating, :float
    remove_column :reviews, :work_environment_rating, :float
    remove_column :reviews, :supervisor_behavior_rating, :float
    remove_column :reviews, :colleague_behavior_rating, :float
    remove_column :reviews, :interesting_tasks_rating, :float
    remove_column :reviews, :communication_rating, :float
    remove_column :reviews, :equality_rating, :float
    remove_column :reviews, :elder_colleagues_rating, :float
    remove_column :reviews, :career_rating, :float
    remove_column :reviews, :salary_rating, :float
    remove_column :reviews, :working_conditions_rating, :float
   
    remove_column :reviews, :job_state, :string
    remove_column :reviews, :department, :string
  end
end
