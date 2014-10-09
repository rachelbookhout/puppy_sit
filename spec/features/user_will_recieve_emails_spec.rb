require 'rails_helper'

feature 'User will recieve emails', %Q{
  As an user,
  I will recieve emails when a review has been made about me
  When my requests have been responded to and have been "chosen"
  If my request is no longer "chosen" and no longer responded to
} do


  scenario 'recieve an email when a review has been made about me ' do
   prev_mail_count = ActionMailer::Base.deliveries.count
    #create review
    expect(ActionMailer::Base.deliveries.size).to eql(prev_mail_count + 1)
    last_email = ActionMailer::Base.deliveries.last_email
    expect(last_email).to have_subject('')
    #add who the reviewee is
    expect(last_email).to deliver_to('')
  end

  scenario 'recieve an email when my request has been chosen ' do

  end

  scenario 'recieve an email when my request has been unchosen' do

  end
end
