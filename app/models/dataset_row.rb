class DatasetRow < ActiveRecord::Base
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
end
