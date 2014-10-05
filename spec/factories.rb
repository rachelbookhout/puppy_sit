include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user do
    first_name "Brad"
    last_name "Pitt"
    sequence :email do |n|
      "hottie#{n}@hotmail.com"
    end
    password "hottie88"
  end

  factory :request do
    sequence :title do |n|
     "Need help - #{n}"
    end
    sequence :requester_id do |n|
      "#{n}"
    end
    photo { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    dog_name "Fido"
    body "Please watch my puppy"
    start_time '2014-10-04'
    end_time   '2014-10-05'
    pay '20'
    address "10 Perkins Apt 3, Boston MA 02130"
  end

  factory :comment do
    body "What a cute puppy!"
    sequence :user_id do |n|
      "#{n}"
    end
    sequence :request_id do |n|
      "#{n}"
    end
    association :request
    association :user
  end
end
