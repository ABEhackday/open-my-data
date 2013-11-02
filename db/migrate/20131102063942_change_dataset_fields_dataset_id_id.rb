class ChangeDatasetFieldsDatasetIdId < ActiveRecord::Migration
  def change
    change_table :dataset_fields do |t|
        t.remove :dataset_id_id, :name
        t.references :dataset, index: true
    end
  end
end
