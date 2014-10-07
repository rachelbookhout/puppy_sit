class AddColumntoReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :reviewer_id, :integer, null:false
  end
end
