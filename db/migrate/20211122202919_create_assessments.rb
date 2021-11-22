class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
      t.string :name
      t.text :desc
      t.boolean :active
      t.integer :created_by_id

      t.timestamps
    end
  end
end
