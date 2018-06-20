class CreateCharts < ActiveRecord::Migration[5.2]
  def change
    create_table :charts do |t|
      t.references :company, foreign_key: true
      t.string :chart_type

      t.timestamps
    end
  end
end
