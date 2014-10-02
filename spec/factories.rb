FactoryGirl.define do

  factory :user do
    first_name "Brad"
    last_name "Pitt"
    sequence :email do |n|
      "hottie#{n}@hotmail.com"
    end
    password "hottie88"
  end

end
