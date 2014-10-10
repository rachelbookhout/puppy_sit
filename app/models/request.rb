class Request < ActiveRecord::Base
  mount_uploader :photo, RequestPhotoUploader
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :requester, class_name: "User"
  has_many :comments
  has_many :responses
  has_many :responders, through: :responses

  validates :title, presence:true, uniqueness:true
  validates :photo, presence:true
  validates :dog_name, presence:true
  validates :body, presence:true
  validates :start_time, presence:true
  validates :end_time, presence:true
  validates :address, presence:true
  validates :pay, presence:true

end



