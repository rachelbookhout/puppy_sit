class ResponseMailer < ActionMailer::Base
  default from: "requests@puppysitter.com"

  def new_response(responder,request)
    @user = responder
    @request = request
    mail(to: @user.email, subject: "You have agreed to petsit #{@request.dog_name}")
  end
end
