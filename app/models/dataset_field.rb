class DatasetField < ActiveRecord::Base
  attr_accessible :datatype,:dataset_id,:name
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
  default_scope { order('id') }
end
