require 'spec_helper'

describe "A challenge" do
  let(:commitment) { 1000 }
  let(:user2_commitment) { 500 }
  let(:challenge) {
    create_challenge start_date: 10.days.ago,
      end_date: 21.days.from_now
  }
  let(:user) {
    create_user challenge: challenge, commitment: commitment
  }
  let(:user2) {create_user challenge: challenge, commitment: user2_commitment}

  before(:each) do
    create_activity user: user, distance: 100, ascent: 10, date: 2.days.ago
    create_activity user: user, distance: 5, date: 1.day.ago
    create_activity user: user, distance: 1000, achievements: 10, date: 30.day.ago
    create_activity user: user2, distance: 50, ascent: 1000, achievements: 11, date: 2.days.ago
    create_activity user: user2, distance: 200, ascent: 1000, achievements: 11, date: 1.day.ago
  end

  it "can show who has the yellow jersey" do
    expect(challenge.user_with_highest_kilometers).to eq(user2)
  end

  it "can show who has the spotted jersey" do
    expect(challenge.user_with_highest_ascent).to eq(user2)
  end

  it "can show who has the green jersey" do
    expect(challenge.user_with_highest_achievements).to eq(user2)
  end

  it "can show the total commitment/target of its participants" do
    expect(challenge.target).to eq(1500)
  end

  it "can show the total number of days in a challenge" do
    expect(challenge.total_days).to eq(31)
  end

  it "can show the accumulated daily average needed to achieve the target in the challenge time period" do
    expect(challenge.target_needed_to_date).to eq(528)
  end

  it "can show the daily average needed for the challenge" do
    expect(challenge.daily_average).to eq(48)
  end

  it "can show the deficit between the accumulated daily average and the accumulated actual" do
    expect(challenge.deficit).to eq(173)
  end

  it "can show the team total accumulated to date" do
    expect(challenge.accumulated_total).to eq(355)
  end
end
