class Assessment < ApplicationRecord
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
  has_many :questions

  validates :name, :presence => true, :uniqueness => {:scope => :name}

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  
  has_many :assigned_assessments, class_name: 'AssignedAssessment', foreign_key: 'assessment_id'
end
