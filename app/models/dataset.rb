class Dataset < ActiveRecord::Base
  has_many :dataset_fields, dependent: :destroy
  has_many :dataset_rows, dependent: :destroy
  paginates_per 5

  belongs_to :owner, class_name: 'User'
  default_scope { order('created_at DESC') }
end
