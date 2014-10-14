require 'rails_helper'

feature 'Admin can do certain things', %Q{
  As an admin,
  I want to be able to view all users, reviews, responses and requests
  and edit or destroy them at will
} do

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }


  scenario 'Admin can see all users' do
    user = FactoryGirl.create(:user)
    sign_in_as(admin)
    visit '/admin/users'
    expect(page).to have_content(user.first_name)
  end


  scenario "Admin can see all requests" do
    request = FactoryGirl.create(:request)
    sign_in_as(admin)
    visit '/admin/requests'
    expect(page).to have_content(request.dog_name)
  end

  scenario "User should not be able to see these pages" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit 'admin/users'
    expect(page).to have_content("You are not authorized to view this resource.")
  end

  scenario "Admin can delete reviews" do
    @review = FactoryGirl.create(:review)
    @user = @review.reviewable
    sign_in_as(admin)
    visit user_path(@user)
    expect(page).to have_content(@user.first_name)
    expect(page).to have_content("Delete Review")
    click_on "Delete Review"
    expect(page).to have_content("The Review has been sucessfully removed")
  end

  scenario "Admin can delete requests" do
    @request = FactoryGirl.create(:request)
    sign_in_as(admin)
    visit request_path(@request)
    expect(page).to have_content(@request.dog_name)
    expect(page).to have_content("Delete Request")
    click_on "Delete Request"
    expect(page).to have_content("This request has been successfully destroyed")
  end

end
