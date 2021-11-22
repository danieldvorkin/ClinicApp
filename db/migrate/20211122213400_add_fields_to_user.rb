class AddFieldsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :occupation, :string
    add_column :users, :bio, :text
  end
end
