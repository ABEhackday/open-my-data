json.array!(@dataset_rows) do |dataset_row|
  json.extract! dataset_row, :dataset_id_id
  json.url dataset_row_url(dataset_row, format: :json)
end
