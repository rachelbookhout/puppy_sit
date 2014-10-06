class AddIndexandNullFalsetoUser < ActiveRecord::Migration
  def change
    change_column :users, :profile_photo, :string, null:false
    add_index :requests, :requester_id
  end
end
