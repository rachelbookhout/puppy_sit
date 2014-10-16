require 'rails_helper'

feature 'User can view all people they can review', %Q{
  As an User,
  I want to be able to review all the people I have interacted with
  and not be able to review people who I haven't associated with
} do


  scenario 'I can see the people who have answered my requests' do
   @response = FactoryGirl.create(:response)
   @request = @response.request
   @responder = @response.responder
   @user = @request.requester
   sign_in_as(@user)
   visit profile_user_requests_path(@user)
   expect(page).to have_content("Fido")
  end

  scenario "I can see the people who I have answered their request" do
    @response = FactoryGirl.create(:response)
    @user  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@user)
    visit profile_user_responses_path(@user)
    expect(page).to have_content(@response.request.requester.first_name)
  end
end
