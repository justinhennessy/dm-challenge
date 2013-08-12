require 'spec_helper'

describe "A user" do
  let(:commitment) { 1000 }
  let(:challenge) {
    create_challenge start_date: 10.days.ago,
      end_date: 21.days.from_now
  }
  let(:user) {
    create_user challenge: challenge, commitment: commitment
  }

  before(:each) do
    create_activity user: user, distance: 100, ascent: 20, achievements: 1, date: 2.days.ago
    create_activity user: user, distance: 5, ascent: 10, achievements: 98, date: 1.day.ago
  end

  it "must not have a 0 commitment"

  it "can't have a blank commitment"

  it "name can't be blank" do
    user = User.new(commitment: 100)

    expect(user.valid?).to be_false
    expect(user.errors[:name].first).to eq("can't be blank")
  end

  it "can show their daily average" do
    expect(user.daily_average).to eq(32)
  end

  it "can show their total needed to date" do
    expect(user.total_needed_to_date).to eq(352)
  end

  it "can show sum of ascent within a date range" do
    expect(user.total_ascent_for(challenge.period)).to eq(30)
  end

  it "can show sum of achievements within a date range" do
    expect(user.total_achievements_for(challenge.period)).to eq(99)
  end

  it "can show sum of distance within a date range" do
    expect(user.total_distance_for(challenge.period)).to eq(105)
  end

    it "can show the % completed of a commitment" do
    expect(user.percent_completed).to eq(10)
  end

  it "can show a users nickname if present instead of name" do
    user = create_user nickname: "Raezor"

    expect(user.preferred_name).to eq("Raezor")
  end

  context "with a challenge that started 5 days ago and a second user" do
    let(:challenge) {
      create_challenge start_date: 5.days.ago, end_date: 10.days.from_now
    }
    let(:user2_commitment) { 500 }
    let(:user2) {create_user challenge: challenge, commitment: user2_commitment}

    before(:each) do
      @activity1 = create_activity user: user2, distance: 200, date: 1.day.ago
      @activity2 = create_activity user: user2, distance: 51, date: 5.days.ago
      @activity3 = create_activity user: user2, distance: 50, date: 10.days.from_now
      create_activity user: user2, distance: 50, date: 6.days.ago
      create_activity user: user2, distance: 50, date: 11.days.from_now
    end

    it "can show a sum of distance with one on the first day of the challenge and one at the last" do
      expect(user2.total_distance_for(challenge.period)).to eq(301)
    end

    it "can show actvities within a date range" do
      expect(user2.activities_for(challenge.period)).to eq([@activity1,@activity2,@activity3])
    end

    it "can show if a user has the yellow jersey" do
    expect(user2.highest_kilometers?).to eq(TRUE)
  end
  end
end
