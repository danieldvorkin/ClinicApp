class Assessment < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'

  validates :name, :presence => true, :uniqueness => {:scope => :name}
end
