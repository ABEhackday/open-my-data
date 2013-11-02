class ChangeDescriptionCanBeNullInDatasets < ActiveRecord::Migration
  def change
    change_column :datasets, :description, :text, :null => true
  end
end
