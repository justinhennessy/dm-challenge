require 'spec_helper'

describe "A challange" do
  it "can show the total commitment/target of its participants" do

    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge
    user2 = FactoryGirl.create :user, challenge: challenge
    user3 = FactoryGirl.create :user, challenge: challenge

    expect(challenge.target).to eq(3000)
  end
end