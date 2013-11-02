class CreateDatasetFields < ActiveRecord::Migration
  def change
    create_table :dataset_fields do |t|
      t.references :dataset_id, index: true
      t.string :name
      t.integer :datatype

      t.timestamps
    end
  end
end
