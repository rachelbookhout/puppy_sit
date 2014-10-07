class AddRate < ActiveRecord::Migration
  def change
    add_column :requests, :hourly, :boolean
    add_column :requests, :weekly, :boolean
    add_column :requests, :daily, :boolean
  end
end
