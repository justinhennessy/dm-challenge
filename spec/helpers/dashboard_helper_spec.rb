require 'spec_helper'

describe DashboardHelper do
  it "display the number of days left if in the middle of a challenge" do
    challenge = OpenStruct.new start_date: Time.now - 10.days, end_date: Time.now + 21.days

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("22 days left!")
  end

  it "display the number of days until a chanllenge starts" do
    challenge = OpenStruct.new start_date: Time.now + 10.days, end_date: Time.now + 21.days

    assign(:challenge, challenge)
    helper.challenge_countdown.should include("11 days to start!")
  end

  it "display a red button when dificit is over 100"

  it "display a yellow button when deficit is under 100"

  it "display a grey button when dificit is 0"

  it "display a green challenge button if deficit is 0" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 100
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 100

    FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user1, value: 5, date: Time.now - 1.days
    FactoryGirl.create :activity, user: user2, value: 50, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user2, value: 200, date: Time.now - 1.days

    assign(:challenge, challenge)
    helper.style_challenge.should include("btn-success")
  end

  it "displays a list of team members and their stats"
end
