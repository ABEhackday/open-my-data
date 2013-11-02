class RenameMistakenAssociationFields < ActiveRecord::Migration
  def change
    change_table :dataset_data do |t|
        t.rename :dataset_field_id_id, :dataset_field_id
        t.rename :dataset_row_id_id, :dataset_row_id
    end

    change_table :dataset_rows do |t|
        t.rename :dataset_id_id, :dataset_id
    end
  end
end
