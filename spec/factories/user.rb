FactoryGirl.define do
  factory :user do
    name        { Faker::Name.name }
    email       { Faker::Internet.email }
    nickname    ''
    challenge
    commitment  1000
  end
end
