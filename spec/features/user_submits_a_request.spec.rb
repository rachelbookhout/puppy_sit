require 'rails_helper'
include ActionDispatch::TestProcess

feature 'User Submits a Request', %Q{
  As an user, I want to submit a Request
  and have the user know everything they need to know
  about my pooch
} do


  scenario 'User submits the entire form ' do
    request = FactoryGirl.build(:request)
    visit new_request_path
    fill_in "Dog Name", with: request.dog_name
    attach_file 'Photo', 'app/assets/images/demon_puppy.jpg'
    fill_in "Start time", with: request.start_time
    fill_in "End time", with: request.end_time
    fill_in "Address", with: request.address
    fill_in "Title", with: request.title
    fill_in "Body", with: request.body
    click_on "Submit"
    expect(page).to have_content("This Request has been created successfully")
  end


  scenario 'User submits a blank form' do
   request = FactoryGirl.build(:request)
   visit new_request_path
   click_on "Submit"
   expect(page).to have_content("8 error(s) have prevented your form from saving")
  end

end
