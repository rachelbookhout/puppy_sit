class NoMoreResponseMailer < ActionMailer::Base
  default from: "requests@puppysitter.com"

  def no_longer_response(user,response)
    @user = user
    @response = response
    @request = @response.request
    @responder = @response.responder
    mail(to: @user.email, subject: "#{@responder.first_name} has cancelled your sitting arrangement")
  end

end
