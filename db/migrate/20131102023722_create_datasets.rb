class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :description
      t.string :license
      t.string :source
      t.integer :source_type
      t.integer :sync_frequency
      t.integer :owner_id

      t.timestamps
    end
  end
end
