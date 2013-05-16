FactoryGirl.define do
  factory :activity do
    date  { Time.now }
    value 50
    user
  end
end