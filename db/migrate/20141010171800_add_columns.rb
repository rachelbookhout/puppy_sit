class AddColumns < ActiveRecord::Migration
  def change
  add_column :requests, :reviewed, :boolean, default:false
  add_column :users, :responder_rating, :integer
  add_column :users, :requester_rating, :integer
  add_column :responses, :timestamps, :datetime
  end
end
