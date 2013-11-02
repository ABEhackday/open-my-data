class ChangeDatasetFieldDataFormatInDatasetData < ActiveRecord::Migration
  def change
    change_column :dataset_data, :dataset_field_data, :text
  end
end
