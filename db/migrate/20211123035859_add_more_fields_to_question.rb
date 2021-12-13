class AddMoreFieldsToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :option_type, :string
  end
end
