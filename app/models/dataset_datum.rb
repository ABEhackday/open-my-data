class DatasetDatum < ActiveRecord::Base
  belongs_to :dataset_field
  belongs_to :dataset_row
end
