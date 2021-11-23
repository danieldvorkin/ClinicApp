class CreateAssignedAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_assessments do |t|
      t.integer :assessment_id
      t.integer :user_id
      t.string :status, default: 'Not Started'

      t.timestamps
    end
  end
end
