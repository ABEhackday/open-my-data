json.array!(@datasets) do |dataset|
  json.extract! dataset, :id, :name, :description, :license, :source, :source_type, :sync_frequency, :owner_id
  json.url dataset_url(dataset, format: :json)
end
