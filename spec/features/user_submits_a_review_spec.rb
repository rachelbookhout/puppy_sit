require 'rails_helper'

feature 'User Submits a Review', %Q{
  As an User
  I want to submit a review on the people who responded to my request
  and people who I responded to
} do


  scenario 'User submits a filled-out review ' do
    @response = FactoryGirl.create(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    within '.links' do
      click_on "View Pending Reviews"
    end
    click_on "Test"
    fill_in "Title", with: "Awesome!"
    fill_in "Body", with: "They were great"
    select "5", from:"Rating"
    click_on "Create Review"
    expect(page).to have_content("Thank you for submitting your review")
  end


  scenario 'User submits a blank review' do
    @response = FactoryGirl.create(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    visit new_profile_user_review_path(@reviewer)
    click_on "Create Review"
    expect(page).to have_content("can't be blank")
  end
end
