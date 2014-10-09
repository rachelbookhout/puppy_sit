require 'rails_helper'
include ActionDispatch::TestProcess

feature 'Users can edit or delete their accounts', %Q{
  As an user, I want to be able to change my information
  or get off of this site
} do

    before (:each) do
      @user = FactoryGirl.create(:user)
      sign_in_as(@user)
      click_on "My Profile"
     visit profile_user_path(@user)
      click_on "Edit your Profile"
    end

  scenario 'User successfully edits their account' do
    fill_in "Current password", with: @user.password
    attach_file 'Profile photo', 'app/assets/images/demon_puppy.jpg'
    click_on "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end


  scenario 'User unsuccessfully edits their account' do
   fill_in "Current password", with: "ppppppp"
   attach_file 'Profile photo', 'app/assets/images/demon_puppy.jpg'
   click_on "Update"
   expect(page).to have_content("Current password is invalid")
  end

  scenario "User deletes their account" do
    click_on "Cancel my account"
    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
  end
end
