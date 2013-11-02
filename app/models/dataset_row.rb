class DatasetRow < ActiveRecord::Base
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
  alias :data :dataset_data
end
