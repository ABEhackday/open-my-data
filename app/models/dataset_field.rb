class DatasetField < ActiveRecord::Base
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
  default_scope { order('id') }
end
