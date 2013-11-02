json.array!(@dataset_fields) do |dataset_field|
  json.extract! dataset_field, :dataset_id_id, :name, :datatype
  json.url dataset_field_url(dataset_field, format: :json)
end
