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

  it "displays a list of team members and their stats"
end
