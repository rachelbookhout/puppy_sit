class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewable, class_name: "User"

  belongs_to :request
  validates :request, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, :inclusion => {:in => 1..5, :message => "Number must be between 1-5"}

end
