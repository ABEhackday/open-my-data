class Dataset < ActiveRecord::Base
    has_many :dataset_fields, dependent: :destroy
    has_many :dataset_rows, dependent: :destroy
end
