class ChangeIDinReviews < ActiveRecord::Migration
  def change
    rename_column :reviews, :reviewer_id, :reviewable_id
  end
end
