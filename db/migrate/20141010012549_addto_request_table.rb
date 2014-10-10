class AddtoRequestTable < ActiveRecord::Migration
  def change
    add_column :requests, :longitude, :float
    add_column :requests, :latitude, :float
  end
end
