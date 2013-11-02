class DatasetDatum < ActiveRecord::Base
  attr_accessible :dataset_field_id, :dataset_row_id, :dataset_field_data
  belongs_to :dataset_field
  belongs_to :dataset_row
end
