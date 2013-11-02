class ChangeDatasetFieldsAddName < ActiveRecord::Migration
  def change
    change_table :dataset_fields do |t|
        t.string :name
    end
  end
end
