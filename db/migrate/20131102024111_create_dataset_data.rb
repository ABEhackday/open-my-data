class CreateDatasetData < ActiveRecord::Migration
  def change
    create_table :dataset_data do |t|
      t.references :dataset_field_id, index: true
      t.references :dataset_row_id, index: true
      t.string :dataset_field_data

      t.timestamps
    end
  end
end
