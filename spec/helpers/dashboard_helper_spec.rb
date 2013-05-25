require 'spec_helper'

describe DashboardHelper do
  it "display the number of days left if in the middle of a challenge" do
    challenge = OpenStruct.new start_date: 10.days.ago, end_date: 21.days.from_now

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("22 days left!")
  end

  it "display the number of days until a chanllenge starts" do
    challenge = OpenStruct.new start_date: 10.days.from_now, end_date: 21.days.from_now

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("11 days to start!")
  end

  it "display a red button when dificit is over 100"

  it "display a yellow button when deficit is under 100"

  it "display a grey button when dificit is 0"

  it "display a green challenge button if deficit is 0" do
    challenge = create_challenge
    user1     = create_user challenge: challenge, commitment: 100
    user2     = create_user challenge: challenge, commitment: 100
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago
    create_activity user: user2, value: 50, date: 2.days.ago
    create_activity user: user2, value: 200, date: 1.day.ago

    assign(:challenge, challenge)
    helper.style_challenge.should include("btn-success")
  end

  it "display a dark blue challenge button if deficit is above 0" do
    challenge = create_challenge
    user1     = create_user challenge: challenge, commitment: 1000
    user2     = create_user challenge: challenge, commitment: 1000
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago
    create_activity user: user2, value: 50, date: 2.days.ago
    create_activity user: user2, value: 200, date: 1.day.ago

    assign(:challenge, challenge)
    helper.style_challenge.should include("btn-primary")
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
