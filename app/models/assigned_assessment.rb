class AssignedAssessment < ApplicationRecord
  belongs_to :assessment
  belongs_to :user
end
