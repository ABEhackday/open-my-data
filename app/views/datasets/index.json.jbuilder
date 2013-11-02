json.array!(@datasets) do |dataset|
  json.extract! dataset, :name, :description, :license, :source, :source_type, :sync_frequency, :owner_id
  json.url dataset_url(dataset, format: :json)
end
