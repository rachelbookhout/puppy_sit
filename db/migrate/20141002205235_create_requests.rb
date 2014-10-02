class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.integer :requester_id, null: false
      t.string :dog_name
      t.text :body
      t.string :photo
      t.datetime :start_time
      t.datetime :end_time
      t.string :address
      t.timestamps
    end
  end
end
