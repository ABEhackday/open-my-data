json.extract! @dataset, :name, :description, :license, :source, :source_type, :sync_frequency, :owner_id, :created_at, :updated_at
json.row_count @dataset.rows.count
json.first_row @dataset.rows.first.to_hash
