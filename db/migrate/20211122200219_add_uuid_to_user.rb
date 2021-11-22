class AddUuidToUser < ActiveRecord::Migration[6.0]
  def change
     add_uuid_column :users
  end
end
