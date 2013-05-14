FactoryGirl.define do
  factory :challenge do
    sequence(:name) {|n| "Kilometer Smash! (past) #{n}" }
    description  "To make the most kilometers in 31 days"
    start_date   Time.now - 10.days
    end_date     Time.now + 21.days
  end
end