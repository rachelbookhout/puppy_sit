class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :requests
  has_many :comments
  has_many :responses, foreign_key: :responder_id
  has_many :requests, through: :responses
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
