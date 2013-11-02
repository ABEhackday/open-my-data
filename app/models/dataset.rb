class Dataset < ActiveRecord::Base
  has_many :dataset_fields, dependent: :destroy
  has_many :dataset_rows, dependent: :destroy
  alias :fields :dataset_fields
  alias :rows :dataset_rows
  paginates_per 5
  has_many :rates_without_dimension, :as => :rateable, :class_name => "Rate", :dependent => :destroy, :conditions => {:dimension => nil}
  has_many :raters_without_dimension, :through => :rates_without_dimension, :source => :rater

  has_one :rate_average_without_dimension, :as => :cacheable, :class_name => "RatingCache",
          :dependent => :destroy, :conditions => {:dimension => nil}

  has_many :dataset_rates, :dependent => :destroy,
           :conditions => {:dimension => :dataset.to_s},
           :class_name => "Rate",
           :as => :rateable

  has_many :dataset_raters, :through => :dataset_rates, :source => :rater, :source_type => "User"

  has_one :dataset_average, :as => :cacheable, :class_name => "RatingCache",
          :dependent => :destroy, :conditions => {:dimension => :dataset.to_s}

  belongs_to :owner, class_name: 'User'
  default_scope { order('created_at DESC') }

  validates_presence_of :owner, :name
end
