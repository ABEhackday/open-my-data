json.array!(@dataset_parameters) do |dataset_parameter|
  json.extract! dataset_parameter, :placeholder_name, :placeholder_type, :placeholder_coverter, :placeholder_valid_values
  json.url dataset_parameter_url(dataset_parameter, format: :json)
end
