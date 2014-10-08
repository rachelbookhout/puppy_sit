require 'rails_helper'

feature 'User Submits a Review', %Q{
  As an User
  I want to submit a review on the people who responded to my request
  and people who I responded to
} do


  scenario 'User submits a filled-out review ' do
    reviewee = FactoryGirl.create(:user)
    reviewer = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    sign_in_as(reviewer)
    visit new_user_review_path(reviewee)
    #find("#review_reviewable_type", :visible => false).value
    # find("#review_request_id", :visible => false).value
    reviewable_type = page.find('#review_reviewable_type')
    reviewable_type = review.reviewable_type
    request_id = page.find("#review_reviewable_type")
    request_id =  review.request_id
    # fill_in "review_reviewable_type", with: review.reviewable_type
    # fill_in "review_request_id", with: review.request_id
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    fill_in "Rating", with: review.rating
    click_on "Create Review"
    expect(page).to have_content("Thank you for submitting your review")
  end


  scenario 'User submits a blank review' do
    reviewee = FactoryGirl.create(:user)
    reviewer = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    sign_in_as(reviewer)
    visit new_user_review_path(reviewee)
    click_on "Create Review"
    expect(page).to have_content("can't be blank")
  end

  scenario 'User submits a review with a rating higher than 5 ' do
    reviewee = FactoryGirl.create(:user)
    reviewer = FactoryGirl.create(:user)
    review = FactoryGirl.create(:review)
    sign_in_as(reviewer)
    visit new_user_review_path(reviewee)
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    fill_in "Rating", with: 10
    click_on "Create Review"
    expect(page).to have_content("Number must be between 1-5")
  end



end
