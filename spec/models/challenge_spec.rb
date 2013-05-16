require 'spec_helper'

describe "A challenge" do
  it "can show the total commitment/target of its participants" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    expect(challenge.target).to eq(1500)
  end

  it "can show the total number of days in a challenge" do
    challenge = FactoryGirl.create :challenge

    expect(challenge.total_days).to eq(31)
  end

  it "can show the accumulated daily average needed to achieve the target in the challenge time period" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    expect(challenge.target_needed_to_date).to eq(480)
  end

  it "can show the daily average needed for the challenge" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    expect(challenge.daily_average).to eq(48)
  end

  it "can show the deficit between the accumulated daily average and the accumulated actual" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    FactoryGirl.create :actvitiy, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :actvitiy, user: user1, value: 5, date: Time.now - 1.days
    FactoryGirl.create :actvitiy, user: user2, value: 50, date: Time.now - 2.days
    FactoryGirl.create :actvitiy, user: user2, value: 200, date: Time.now - 1.days

    expect(challenge.deficit).to eq(765)
  end
end