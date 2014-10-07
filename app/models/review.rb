class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewable, polymorphic: true
  validates :title, presence:true
  validates :body, presence:true
  validates :rating, presence:true, :inclusion => 1..5
end