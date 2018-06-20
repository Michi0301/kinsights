class CreateDataSets < ActiveRecord::Migration[5.2]
  def change
    create_table :data_sets do |t|
      t.string :dataset_type
      t.references :chart, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
