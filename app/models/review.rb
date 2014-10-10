class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewable, class_name: "User"

  belongs_to :request
  validates :request, presence: true
  validates :title, presence: true
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, :inclusion => {:in => 1..5, :message => "Number must be between 1-5"}


  def calc_responder_review(user)
    responder_reviews = Review.where(reviewable_id:user.id, reviewable_type:"responder")
    response_rating = 0
    responder_reviews.each do |review|
      review.rating += response_rating
    end
    @response_rating = response_rating/reponder_reviews.length
  end

  def calc_requester_review(user)
    requester_reviews = Review.where(reviewble:user.id, reviewable_type:"requester")
     requester_rating = 0
    requester_reviews.each do |review|
      review.rating += requester_rating
    end
    @requester_rating = requester_rating/requester_reviews.length
  end

  def update_review_score(user)
    calc_responder_review(user)
    calc_requester_review(user)
    @requester_rating = user.requester_rating
    @response_rating = user.responder_rating
  end


end
