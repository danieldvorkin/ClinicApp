class CreateActiveAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :active_assessments do |t|
      t.integer :assessment_id
      t.integer :user_id
      t.string :status

      t.timestamps
    end
    enable_extension 'hstore'
    add_column :active_assessments, :results, :hstore
  end
end
