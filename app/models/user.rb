class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :requests, foreign_key: :requester_id
  has_many :comments
  has_many :responses, foreign_key: :responder_id
  has_many :reviews, as: :reviewable
  # has_many :reviews, as: :reviewer#, source: :requester
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.user_reviews_requester(current_user)
   @reviewable_requesters = []
    current_user.responses.each do |response|
     @reviewable_requesters << response.request.requester
     end
     #uniq! throws errors if there is just one hence the long way
   @reviewable_requesters = @reviewable_requesters.uniq
  end

  def self.user_reviews_responder(current_user)
    @reviewable_responders = []
    current_user.requests.each do |request|
      request.responses.each do |trans|
        @reviewable_responders  << trans.responder
      end
    end
   @reviewable_responders = @reviewable_responders.uniq
  end

end
