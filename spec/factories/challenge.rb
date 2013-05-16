FactoryGirl.define do
  factory :challenge do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    start_date  { Time.now - 10.days }
    end_date    { Time.now + 21.days }
  end
end
