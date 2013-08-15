FactoryGirl.define do
  factory :activity do
    date  { Time.current }
    distance 50
    user
  end
end
