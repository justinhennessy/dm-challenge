FactoryGirl.define do
  factory :activity do
    date  { Time.now }
    distance 50
    user
  end
end
