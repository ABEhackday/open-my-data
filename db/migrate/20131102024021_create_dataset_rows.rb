class CreateDatasetRows < ActiveRecord::Migration
  def change
    create_table :dataset_rows do |t|
      t.references :dataset_id, index: true

      t.timestamps
    end
  end
end
