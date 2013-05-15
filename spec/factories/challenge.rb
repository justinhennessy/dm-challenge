FactoryGirl.define do
  factory :challenge do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    start_date {Time.now}
    end_date {Time.now + 14.days}
  end
end
