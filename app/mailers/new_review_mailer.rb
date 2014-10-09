class NewReviewMailer < ActionMailer::Base
  default from: "reviews@puppysitter.com"

  def new_review(user)
    @user = user
    @url = "http://localhost:3000/profile/users/#{@user.id}"
    mail(to: @user.email, subject: "You have recieved a new review")
  end
end
