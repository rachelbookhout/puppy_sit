require 'rails_helper'
include ActionDispatch::TestProcess

feature 'User can view other users', %Q{
  As an user,
  I want to be able to see other user's reviews
  so I can know what sort of person is helping me
} do


  scenario 'User view other users' do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    sign_in_as(@user)
    visit user_path(@user2)
    expect(page).to have_content(@user.first_name)
    expect(page).to have_content(@user.profile)
  end
end
