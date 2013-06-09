require 'spec_helper'

describe "A user" do
  it "must have a commitment set"

  it "can show sum of activities within a date range" do
    challenge = create_challenge start_date: 5.days.ago, end_date:\
      10.days.from_now
    user      = create_user challenge: challenge
    create_activity user: user, value: 100, date: 1.days.ago
    create_activity user: user, value: 100, date: 2.day.ago
    create_activity user: user, value: 100, date: 3.days.ago
    create_activity user: user, value: 5, date: 10.day.ago

    expect(user.sum_of_activities_for(challenge)).to eq(300)
  end

  it "can show a sum of activities with one on the first day of the challenge" do
    challenge = create_challenge start_date: 5.days.ago,\
      end_date: 10.days.from_now
    user      = create_user challenge: challenge
    create_activity user: user, value: 100, date: 6.days.ago
    create_activity user: user, value: 100, date: 5.days.ago
    create_activity user: user, value: 100, date: 4.days.ago

    expect(user.sum_of_activities_for(challenge)).to eq(200)
  end

  it "can show a sum of activities with one on the last day of the challenge" do
    challenge = create_challenge start_date: 5.days.ago,\
      end_date: 10.days.from_now
    user      = create_user challenge: challenge
    create_activity user: user, value: 50, date: 9.days.from_now
    create_activity user: user, value: 45, date: 10.days.from_now
    create_activity user: user, value: 100, date: 11.days.from_now

    expect(user.sum_of_activities_for(challenge)).to eq(95)
  end

  it "can show an activity that is logged on the first day of a challenge" do
    challenge = create_challenge start_date: 5.days.ago,\
      end_date: 10.days.from_now
    user      = create_user challenge: challenge
    create_activity user: user, value: 50, date: 5.days.ago

    expect(user.sum_of_activities_for(challenge)).to eq(50)
  end

  it "can show an activity that is logged on the last day of a challenge" do
    challenge = create_challenge start_date: 5.days.ago,\
      end_date: 10.days.from_now
    user      = create_user challenge: challenge
    create_activity user: user, value: 50, date: 10.days.from_now

    expect(user.sum_of_activities_for(challenge)).to eq(50)
  end

  it "can show actvities within a date range" do
    challenge = create_challenge start_date: 5.days.ago,\
      end_date: 10.days.from_now
    user      = create_user challenge: challenge
    activity1 = create_activity user: user, value: 100, date: 1.days.ago
    create_activity user: user, value: 5, date: 10.day.ago

    expect(user.activities_for(challenge)).to eq([] << activity1)
  end

  it "can show the % completed of a commitment" do
    user = create_user commitment: 1000

    create_activity user: user, value: 100, date: 2.days.ago
    create_activity user: user, value: 100, date: 1.day.ago

    expect(user.percent_completed).to eq(20)
  end

  it "can show a users nickname if present instead of name" do
    user = create_user nickname: "Raezor"

    expect(user.preferred_name).to eq("Raezor")
  end

  it "can show if a user has the yellow jersey" do
    user1 = create_user
    user2 = create_user

    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 300, date: 1.day.ago
    create_activity user: user2, value: 100, date: 1.day.ago
    create_activity user: user2, value: 100, date: 1.day.ago

    expect(user1.highest_kilometers?).to eq(TRUE)
  end
end
