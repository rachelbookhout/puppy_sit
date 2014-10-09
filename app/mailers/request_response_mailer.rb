class RequestResponseMailer < ActionMailer::Base
  default from: "requests@puppysitter.com"

  def request_granted(user, request)
    @user = user
    @request = request
    @responder = @request.responders
    mail(to: @user.email, subject: "You have a babysitter!")
  end
end
