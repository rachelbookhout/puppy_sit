class Responder < ActiveRecord::Base
  belongs_to :responder, class_name "User"
  belongs_to :request
end
