require 'rails_helper'
include ActionDispatch::TestProcess

feature 'User Submits a Comment', %Q{
  As an user,
  I want to write a comment to a request
  so I can gather more information about the request
} do

  context "authenticated user" do
    before (:each) do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
    end
  end

  scenario 'User Submits a Comment' do
    request = FactoryGirl.create(:request)
    comment = FactoryGirl.create(:comment)
    visit request_path(request)
    save_and_open_page
    fill_in "Questions?", with: comment.body
    click_on "Submit"
    expect(page).to have_content("Your comment has been added")
  end

  scenario 'User Submit a Blank Comment' do
    request = FactoryGirl.create(:request)
    comment = FactoryGirl.create(:comment)
    visit request_path(request)
    click_on "Submit"
    expect(page).to have_content("Please input something into your comment")
  end

end
