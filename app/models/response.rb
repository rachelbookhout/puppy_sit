class Response < ActiveRecord::Base
  belongs_to :responder, class_name: "User"
  belongs_to :request
  validates :request_id, uniqueness: true
end
