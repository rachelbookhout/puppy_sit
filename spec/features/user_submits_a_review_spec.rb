require 'rails_helper'

feature 'User Submits a Review', %Q{
  As an User
  I want to submit a review on the people who responded to my request
  and people who I responded to
} do


  scenario 'User submits a filled-out review ' do
    @response = FactoryGirl.build(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    click_on "View Pending Reviews"
    click_on "#{@response.request.dog_name}"
    fill_in "Title", with: "Awesome!"
    fill_in "Body", with: "They were great"
    fill_in "Rating", with: 5
    click_on "Create Review"
    expect(page).to have_content("Thank you for submitting your review")
  end


  scenario 'User submits a blank review' do
    @response = FactoryGirl.build(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    click_on "View Pending Reviews"
    click_on "#{@response.request.dog_name}"
    click_on "Create Review"
    expect(page).to have_content("can't be blank")
  end

  scenario 'User submits a review with a rating higher than 5 ' do
    @response = FactoryGirl.build(:response)
    @reviewer  = @response.responder
    @requester = @response.request.requester
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    click_on "View Pending Reviews"
    click_on "#{@response.request.dog_name}"
    fill_in "Title", with: "Awesome!"
    fill_in "Body", with: "They were great"
    fill_in "Rating", with: 10
    click_on "Create Review"
    expect(page).to have_content("Number must be between 1-5")
  end
end
