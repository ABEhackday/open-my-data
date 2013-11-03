class DatasetRow < ActiveRecord::Base
  belongs_to :dataset
  has_many :dataset_data, dependent: :destroy
  alias :data :dataset_data

  def to_hash
    Hash[data.joins(:dataset_field).order('dataset_fields.id').map do |datum|
      [datum.dataset_field.name, datum.dataset_field_data]
    end]
  end

  def main_field_data
    data.find_by_dataset_field_id(dataset.main_field.id)
  end
end
