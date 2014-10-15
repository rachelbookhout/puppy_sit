include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :user, aliases: [:requester, :responder, :reviewer, :reviewable] do
    first_name "Brad"
    last_name "Pitt"
    sequence :email do |n|
      "hottie431418#{n}@hotmail.com"
    end
    password "hottie88"
    profile_photo { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    profile "I'm a barbie girl in a barbie world!"
    role "user"
  end

  factory :request do
    sequence :title do |n|
     "Need help - #213{n}"
    end
    sequence :id do |n|
     "#{n}6363"
    end
    photo { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.png'), 'image/png') }
    dog_name "Fido"
    body "Please watch my puppy"
    start_time '2014-10-04'
    end_time   '2014-10-05'
    pay '20'
    address "10 Perkins Apt 3, Boston MA 02130"
    association :requester, factory: :user
  end

  factory :response do
    chosen false

    association :request
    association :responder
  end

  factory :comment do
    body "What a cute puppy!"
    association :request
    association :user
  end

  factory :review do
    title "What a Great Sitter"
    body "I was so happy with the job she did"
    rating 5
    association :request
    association :reviewer
    association :reviewable
    reviewable_type "Requester"
  end
end
