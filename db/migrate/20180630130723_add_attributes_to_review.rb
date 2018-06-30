# frozen_string_literal: true

class AddAttributesToReview < ActiveRecord::Migration[5.2]
  def change
    change_table :reviews do |t|
      t.float :response_quality_rating
      t.float :response_time_rating
      t.float :application_process_rating
      t.float :interview_professionality_rating
      t.float :information_completeness_rating
      t.float :interview_mood_rating
      t.float :applicant_threatment_rating
      t.float :answer_quality_rating
      t.float :further_steps_rating
      t.float :timely_interview_result_rating

      t.integer :application_year
      t.string :result
    end
  end
end
