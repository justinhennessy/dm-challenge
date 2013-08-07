require 'spec_helper'

describe DashboardHelper do
  it "display the number of days left if in the middle of a challenge" do
    challenge = OpenStruct.new start_date: 10.days.ago,\
      end_date: 21.days.from_now

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("22 days left!")
  end

  it "display the number of days until a chanllenge starts" do
    challenge = OpenStruct.new start_date: 10.days.from_now,\
      end_date: 21.days.from_now

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("11 days to start!")
  end

  it "display a red button when dificit is over 100"

  it "display a yellow button when deficit is under 100"

  it "display a grey button when dificit is 0"

  let(:commitment) { 100 }
  let(:challenge) {
    create_challenge start_date: 10.days.ago,
      end_date: 21.days.from_now
  }
  let(:user1) {
    create_user challenge: challenge, commitment: commitment
  }
  let(:user2) {
    create_user challenge: challenge, commitment: commitment
  }

  before(:each) do
    create_activity user: user1, distance: 100, date: 2.days.ago
    create_activity user: user1, distance: 5, date: 1.day.ago
    create_activity user: user2, distance: 50, date: 2.days.ago
    create_activity user: user2, distance: 200, date: 1.day.ago
  end

  it "display a green challenge button if deficit is <= 0" do
    assign(:challenge, challenge)
    helper.style_challenge.should include("btn-success")
  end

  context "where commitment is greater than activity completed" do
    let(:commitment) { 1000 }

    it "display a dark blue challenge button if deficit is > 0" do
      assign(:challenge, challenge)
      helper.style_challenge.should include("btn-primary")
    end
  end
end
