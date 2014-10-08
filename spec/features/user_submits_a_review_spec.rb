require 'rails_helper'

feature 'User Submits a Review', %Q{
  As an User
  I want to submit a review on the people who responded to my request
  and people who I responded to
} do


  scenario 'User submits a filled-out review ' do
    review = FactoryGirl.build(:review)
    sign_in_as(review.reviewer)
    visit new_user_review_path(review.reviewer)
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    fill_in "Rating", with: review.rating
    click_on "Create Review"
    expect(page).to have_content("Thank you for submitting your review")
  end


  scenario 'User submits a blank review' do
    review = FactoryGirl.build(:review)
    sign_in_as(review.reviewer)
    visit new_user_review_path(review.reviewer)
    click_on "Create Review"
    expect(page).to have_content("can't be blank")
  end

  scenario 'User submits a review with a rating higher than 5 ' do
    review = FactoryGirl.build(:review)
    sign_in_as(review.reviewer)
    visit new_user_review_path(review.reviewer)
    fill_in "Title", with: review.title
    fill_in "Body", with: review.body
    fill_in "Rating", with: 10
    click_on "Create Review"
    expect(page).to have_content("Number must be between 1-5")
  end



end
