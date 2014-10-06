class Response < ActiveRecord::Base
  belongs_to :responder, class_name: "User"
  belongs_to :request
  validates :responder, uniqueness: true
end
