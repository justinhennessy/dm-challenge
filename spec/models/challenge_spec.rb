require 'spec_helper'

describe "A challenge" do
  it "can show who has the yellow jersey" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago
    create_activity user: user2, value: 50, date: 2.days.ago
    create_activity user: user2, value: 200, date: 1.day.ago

    expect(challenge.yellow_jersey?).to eq(user2)
  end

  it "can show the total commitment/target of its participants" do
    challenge = create_challenge
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500

    expect(challenge.target).to eq(1500)
  end

  it "can show the total number of days in a challenge" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now

    expect(challenge.total_days).to eq(31)
  end

  it "can show the accumulated daily average needed to achieve the target in the challenge time period" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500

    expect(challenge.target_needed_to_date).to eq(480)
  end

  it "can show the daily average needed for the challenge" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500

    expect(challenge.daily_average).to eq(48)
  end

  it "can show the deficit between the accumulated daily average and the accumulated actual" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago
    create_activity user: user2, value: 50, date: 2.days.ago
    create_activity user: user2, value: 200, date: 1.day.ago

    expect(challenge.deficit).to eq(125)
  end

  it "shows a 0 deficit if the its negative" do
    challenge = create_challenge start_date: 10.days.from_now, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 100
    user2     = create_user challenge: challenge, commitment: 100
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago
    create_activity user: user2, value: 50, date: 2.days.ago
    create_activity user: user2, value: 200, date: 1.day.ago

    expect(challenge.deficit).to eq(0)
  end

  it "can show the team total accumulated to date" do
    challenge = create_challenge start_date: 10.days.from_now, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 500
    create_activity user: user1, value: 5, date: 1.days.ago
    create_activity user: user1, value: 200, date: 1.day.ago

    expect(challenge.accumulated_total).to eq(205)
  end

  def create_challenge attributes = {}
    FactoryGirl.create :challenge, attributes
  end

  def create_user attributes = {}
    FactoryGirl.create :user, attributes
  end

  def create_activity attributes = {}
    FactoryGirl.create :activity, attributes
  end
end