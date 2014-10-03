class AddPaytoRequests < ActiveRecord::Migration
  def change
  add_column :requests, :pay, :integer, null:false
  end
end
