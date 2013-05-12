require 'spec_helper'

describe "A challange" do
  it "can show the total commitment/target of its participants" do
    start_date = Time.now - 10.days
    end_date = start_date + 31.days

    challenge = Challenge.create(name:          "Kilometer Smash!",
                                  description:  "To make the most kilometers in 31 days",
                                  start_date:   start_date,
                                  end_date:     end_date)

    user1 = User.create(name:         "Justin Hennessy",
                          email:      "justhennessy@gmail.com",
                          commitment: "1000")

    user2 = User.create(name:         "Rhys Mason",
                          email:      "mason@gmail.com",
                          commitment: "1000")

    user3 = User.create(name:         "Kelly Hennessy",
                          email:      "h@gmail.com",
                          commitment: "1000")

    user1.challenge = challenge
    user1.save
    user2.challenge = challenge
    user2.save
    user3.challenge = challenge
    user3.save

    expect(challenge.target).to eq(3000)
  end
end