require 'rails_helper'

feature 'User can edit or delete a Review', %Q{
  As an User
  I want to edit and delete the reviews I have written
  in case I change my mind
} do


  scenario 'User edits a review ' do
    @review = FactoryGirl.create(:review)
    @reviewer  = @review.reviewer
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    click_on "Edit and Delete Reviews You Have Made"
    click_on "Edit Review"
    fill_in "Title", with: "Awesome!"
    fill_in "Body", with: "They were great"
    fill_in "Rating", with: 5
    click_on "Update Review"
    expect(page).to have_content("Thank you for the updated review")
  end

  scenario 'User deletes a review ' do
    @review = FactoryGirl.create(:review)
    @reviewer  = @review.reviewer
    sign_in_as(@reviewer)
    click_on "My Profile"
    visit profile_user_path(@reviewer)
    click_on "Edit and Delete Reviews You Have Made"
    click_on "Delete Review"
    expect(page).to have_content("Your review has been deleted")
  end
end
