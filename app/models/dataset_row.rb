class DatasetRow < ActiveRecord::Base
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
  alias :data :dataset_data

  def to_hash
    Hash[data.joins(:dataset_field).order('dataset_fields.id').map do |datum|
      [datum.dataset_field.name, datum.dataset_field_data]
    end]
  end
end
