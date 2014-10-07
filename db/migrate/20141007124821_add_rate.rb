class AddRate < ActiveRecord::Migration
  def change
    add_column :requests, :hourly, :boolean,default: false
    add_column :requests, :weekly, :boolean,default: false
    add_column :requests, :daily, :boolean, default: false
  end
end
