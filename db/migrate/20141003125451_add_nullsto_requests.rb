class AddNullstoRequests < ActiveRecord::Migration
  def change
  change_column :requests, :dog_name, :string, null:false
  change_column :requests, :body, :text,null:false
  change_column :requests, :photo, :string, null:false
  change_column :requests, :start_time, :datetime, null:false
  change_column :requests, :end_time, :datetime, null:false
  change_column :requests, :address, :string, null:false
  end
end

