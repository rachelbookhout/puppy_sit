require 'rails_helper'
include ActionDispatch::TestProcess

feature "User creates a new account", %Q{
As an user,
I want to create an account
and be asked to sign in again once logged in
}  do

  scenario "User provides required information" do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    attach_file 'Profile photo', 'app/assets/images/demon_puppy.jpg'
    within '.new_user' do
      click_on "Sign up"
    end
    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario "User doesn't provide required information" do
    visit root_path
    click_on "Sign up"
    within '.new_user' do
      click_on "Sign up"
    end
    expect(page).to have_content "Email can't be blank"
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "2 errors prohibited this user from being saved: Email can't be blank"
  end

  scenario "Email is already in use" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign up"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    within '.new_user' do
      click_on "Sign up"
    end
    expect(page).to have_content "Email has already been taken"
  end

  scenario "Passwords don't match" do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: "fpfejfkef"
    within '.new_user' do
      click_on "Sign up"
    end
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "User is signed in" do

    user = FactoryGirl.create(:user)
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to_not have_content "Sign up"
  end
end
