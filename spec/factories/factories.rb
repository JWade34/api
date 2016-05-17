FactoryGirl.define do

  factory :client do
    name "John Smith"
    address "1234 Congress"
    city "Austin"
    state "TX"
    zip "11111"
    country "US"
    phone "123-456-7890"
    website "www.website.com"
  end

  factory :user do
    name "admin"
    email "janedoe@janedoe.com"
    password "password"
  end


end
