class AddProfileandIndex < ActiveRecord::Migration
  def change
    add_column :users, :profile, :string
    add_index :comments, :request_id
    add_index :comments, :user_id
    add_index :responses, :responder_id
    add_index :responses, :request_id
    add_index :reviews, :reviewable_id
    add_index :reviews, :request_id
    add_index :reviews, :reviewer_id
  end
end
