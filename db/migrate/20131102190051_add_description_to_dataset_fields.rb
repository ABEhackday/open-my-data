class AddDescriptionToDatasetFields < ActiveRecord::Migration
  def change
    add_column :dataset_fields, :description, :text
  end
end
