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
    visit edit_profile_user_review_path(@reviewer, @review)
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
    visit profile_user_path(@reviewer)
    click_on "Edit and Delete Reviews You Have Made"
    within '.delete' do
      click_on "Dogbone"
    end
    expect(page).to have_content("Your review has been deleted")
  end
end
