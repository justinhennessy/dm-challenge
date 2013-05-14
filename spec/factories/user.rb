FactoryGirl.define do
  factory :user1, class: 'User' do
    name        "Justin Hennessy"
    email       "justhennessy@gmail.com"
    commitment  "1000"
  end

  factory :user2, class: 'User' do
    name        "Ryhs Mason"
    email       "blah1@gmail.com"
    commitment  "1000"
  end

  factory :user3, class: 'User' do
    name        "Kelly Hennessy"
    email       "blah2@gmail.com"
    commitment  "1000"
  end
end