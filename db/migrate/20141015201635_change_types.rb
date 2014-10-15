class ChangeTypes < ActiveRecord::Migration
  def change
    change_column :users, :profile, :text
    change_column :requests, :body, :text
  end
end
