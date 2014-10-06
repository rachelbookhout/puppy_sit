class AddReviewTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :reviewable_type, null:false
      t.integer :reviewer_id, null:false
      t.string :title, null:false
      t.string :body, null:false
      t.integer :rating, null:false
      t.integer :request_id, null:false
    end
  end
end
