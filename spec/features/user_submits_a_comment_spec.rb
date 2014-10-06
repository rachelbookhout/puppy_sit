require 'rails_helper'
include ActionDispatch::TestProcess

feature 'User Submits a Comment', %Q{
  As an user,
  I want to write a comment to a request
  so I can gather more information about the request
} do


  scenario 'User Submits a Comment' do
    comment = FactoryGirl.build(:comment)
    sign_in_as(comment.user)
    visit request_path(comment.request)
    fill_in "comment_body", with: comment.body
    click_on "Create Comment"
    expect(page).to have_content("Your comment has been added")
  end

  scenario 'User Submit a Blank Comment' do
    comment = FactoryGirl.build(:comment)
    sign_in_as(comment.user)
    visit request_path(comment.request)
    click_on "Create Comment"
    expect(page).to have_content("Please input something into your comment")
  end

end
