class CreateResponder < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :responder_id, null:false
      t.integer :request_id, null:false
      t.boolean :chosen, default: false, null:false
    end
  end
end
