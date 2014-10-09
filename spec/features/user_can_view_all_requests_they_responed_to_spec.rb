require 'rails_helper'

feature 'User can see all requests they have responded to', %Q{
  As an User,
  I want to know when the jobs I have agreed to do are
} do


  scenario 'User sees all their responses' do
   @response = FactoryGirl.create(:response)
   @responder = @response.responder
   sign_in_as(@responder)
   click_on "My Profile"
   visit profile_user_path(@responder)
   click_on "View your Responses"
   expect(page).to have_content("Done for #{@response.request.requester.first_name}")
  end
end
