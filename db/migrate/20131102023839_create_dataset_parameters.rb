class CreateDatasetParameters < ActiveRecord::Migration
  def change
    create_table :dataset_parameters do |t|
      t.string :placeholder_name
      t.integer :placeholder_type
      t.string :placeholder_coverter
      t.string :placeholder_valid_values

      t.timestamps
    end
  end
end
