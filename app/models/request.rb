class Request < ActiveRecord::Base
  mount_uploader :photo, RequestPhotoUploader

  belongs_to :user
  has_many :comments
end
