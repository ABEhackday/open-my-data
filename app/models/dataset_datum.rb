class DatasetDatum < ActiveRecord::Base
  belongs_to :dataset_field_id
  belongs_to :dataset_row_id
end
