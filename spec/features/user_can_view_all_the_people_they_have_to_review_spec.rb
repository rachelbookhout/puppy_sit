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
   click_on "My Profile"
   visit profile_user_path(@user)
   click_on "View Pending Reviews"
   expect(page).to have_content(@responder.first_name)
  end

  scenario "I can see the people who I have answered their request" do
    @response = FactoryGirl.create(:response)
    @user  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@user)
    click_on "My Profile"
    visit profile_user_path(@user)
    click_on "View Pending Reviews"
    expect(page).to have_content("#{@requester.first_name}")
  end


  scenario 'I do not have a relationship with these people ' do
  end

  scenario "I can only view people who have had their request/response time already pass" do
  end

  scenario "I can only review a person once per interaction we have had" do
  end

  scenario "I can undo a response and put the request live"
  end

end
