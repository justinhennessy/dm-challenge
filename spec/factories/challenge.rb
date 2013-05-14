FactoryGirl.define do
  factory :past_challenge, class: 'Challenge' do
    name         "Kilometer Smash! (past)"
    description  "To make the most kilometers in 31 days"
    start_date   Time.now - 60.days
    end_date     Time.now - 30.days
  end

  factory :current_challenge, class: 'Challenge' do
    name         "Kilometer Smash! (current)"
    description  "To make the most kilometers in 31 days"
    start_date   Time.now - 10.days
    end_date     Time.now + 21.days
  end

  factory :future_challenge, class: 'Challenge' do
    name         "Kilometer Smash! (future)"
    description  "To make the most kilometers in 31 days"
    start_date   Time.now - 10.days
    end_date     Time.now + 21.days
  end  
end