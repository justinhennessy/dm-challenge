FactoryGirl.define do
  factory :user do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    challenge
    commitment  1000
  end
end
