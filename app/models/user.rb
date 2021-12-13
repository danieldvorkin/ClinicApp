class User < ApplicationRecord
  uuidable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assessments, class_name: 'Assessment', foreign_key: 'created_by_id'
  has_many :assigned_assessments, class_name: 'AssignedAssessment', foreign_key: 'user_id'
end
