class Dataset < ActiveRecord::Base
  paginates_per 5

  belongs_to :owner, class_name: 'User'
  default_scope { order('created_at DESC') }
end
