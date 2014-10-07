class AddRate < ActiveRecord::Migration
  def change
    add_column :requests, :pay_time, :string
  end
end
