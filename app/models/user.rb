class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :requests, foreign_key: :requester_id
  has_many :comments
  has_many :responses, foreign_key: :responder_id

  has_many :reviews, as: :reviewable, source: :requester
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def responder_reviews
  end

  def requester_reviews
  end
end
