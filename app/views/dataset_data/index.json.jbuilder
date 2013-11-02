json.array!(@dataset_data) do |dataset_datum|
  json.extract! dataset_datum, :dataset_field_id_id, :dataset_row_id_id, :dataset_field_data
  json.url dataset_datum_url(dataset_datum, format: :json)
end
