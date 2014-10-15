require 'rails_helper'

feature 'User Responds to a Request', %Q{
  As an user,
  I want to be able to volunteer my time
  and watch puppies
} do


  scenario 'User successfully responds to a request' do
    response = FactoryGirl.build(:response)
    sign_in_as(response.responder)
    visit request_path(response.request)
    click_on "I Want to Help!"
    expect(page).to have_content ("Thank you for your help. Please look at your email to learn about the next steps")
  end
end
