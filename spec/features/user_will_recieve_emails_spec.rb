require 'rails_helper'

feature 'User will recieve emails', %Q{
  As an user,
  I will recieve emails when a review has been made about me
  When my requests have been responded to and have been "chosen"
  If my request is no longer "chosen" and no longer responded to
} do

  scenario 'recieve an email when my request has been chosen ' do
    ActionMailer::Base.deliveries = []
    prev_mail_count = ActionMailer::Base.deliveries.count
    @request = FactoryGirl.create(:request)
    @requester = @request.requester
    @responder = FactoryGirl.create(:user)
    sign_in_as(@responder)
    visit request_path(@request)
    click_on "I Want to Help!"
    expect(page).to have_content("Thank you for your help. Please look at your email to learn about the next steps")
    expect(ActionMailer::Base.deliveries.size).to eql(prev_mail_count + 2)
    first_email = ActionMailer::Base.deliveries.first
    expect(first_email).to have_subject('You have a babysitter!')
    expect(first_email).to deliver_to(@requester.email)
  end


 scenario 'revieve an email when I have responded to a request' do
    prev_mail_count = ActionMailer::Base.deliveries.count
    @request = FactoryGirl.create(:request)
    @requester = @request.requester
    @responder = FactoryGirl.create(:user)
    sign_in_as(@responder)
    visit request_path(@request)
    click_on "I Want to Help!"
    expect(page).to have_content("Thank you for your help. Please look at your email to learn about the next steps")
    expect(ActionMailer::Base.deliveries.size).to eql(prev_mail_count + 2)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('You have agreed to petsit Fido')
    expect(last_email).to deliver_to(@responder.email)
  end



  scenario 'recieve an email when a review has been made about me ' do
    @response = FactoryGirl.create(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    within '.click-review' do
      click_on "View Pending Reviews"
    end
    click_on "Test"
    fill_in "Title", with: "Awesome!"
    fill_in "Body", with: "They were great"
    select "5", from: "Rating"
    click_on "Create Review"
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to deliver_to(@requester)
    expect(last_email).to have_subject('You have recieved a new review')
  end


  scenario 'recieve an email when my request has been unchosen' do
    prev_mail_count = ActionMailer::Base.deliveries.count
    @response = FactoryGirl.create(:response)
    @responder = @response.responder
    sign_in_as(@responder)
    click_on "My Profile"
    visit profile_user_path(@responder)
    click_on "View your Responses"
    visit profile_user_responses_path(@responder)
    click_on "Paw"
    expect(ActionMailer::Base.deliveries.size).to eql(prev_mail_count + 1)
    last_email = ActionMailer::Base.deliveries.last
    @person = @response.request.requester.first_name
    expect(last_email).to have_subject("#{@person} has cancelled your sitting arrangement")
    expect(last_email).to deliver_to(@response.request.requester.email)
  end
end
