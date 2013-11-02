class ChangeDescriptionNotNullInDatasets < ActiveRecord::Migration
  def change
    change_column :datasets, :description, :text, null: false
  end
end
