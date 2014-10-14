class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
  has_many :requests, foreign_key: :requester_id
  has_many :comments
  has_many :responses, foreign_key: :responder_id
  has_many :reviews, as: :reviewable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.user_reviews_requester(current_user)
    @reviewable_requesters = []
    if current_user.responses.empty? == false
      current_user.responses.each do |response|
        if response.request.reviewed == false && response.request.end_time < Time.now
            @reviewable_requesters << response.request.requester
        end
      end
      @reviewable_requesters = @reviewable_requesters.uniq
    end
  end

  def self.user_reviews_responder(current_user)
    @reviewable_responders = []
    if current_user.requests.empty? == false
      current_user.requests.each do |request|
          if request.reviewed == false && request.end_time < Time.now
            request.responses.each do |trans|
              @reviewable_responders  << trans.responder
            end
          end
       end
      @reviewable_responders = @reviewable_responders.uniq
    end
  end


def is_admin?
  role == 'admin'
end

end
