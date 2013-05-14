require 'spec_helper'

describe "A challange" do
  it "can show the total commitment/target of its participants" do

    challenge = FactoryGirl.create :current_challenge

    user1 = FactoryGirl.create :user1
    user2 = FactoryGirl.create :user2
    user3 = FactoryGirl.create :user3

    user1.challenge = challenge
    user1.save
    user2.challenge = challenge
    user2.save
    user3.challenge = challenge
    user3.save

    expect(challenge.target).to eq(3000)
  end
end