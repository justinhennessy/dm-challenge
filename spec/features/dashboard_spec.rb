require 'spec_helper'

describe "Viewing the dashboard" do

  it "shows the number of days until the challenge starts" do

    future_challenge = FactoryGirl.create :challenge, start_date: Time.now + 12.days, end_date: Time.now + 30.days

    visit dashboard_path

    expect(page).to have_text("11 days to start!")
  end

  it "shows the number of days left in a challenge once it has started" do
    
    challenge = FactoryGirl.create :challenge

    visit dashboard_path

    expect(page).to have_text("11 days left!")
  end

  it "shows the teams target for the current challenge" do

    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    visit dashboard_path

    expect(page).to have_text("Team commitment is 1500")
  end

  it "shows the teams accumulative total to date"

  it "shows the accumulative total needed to hit challenge target to date" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    visit dashboard_path

    expect(page).to have_text("Team target needed is 480")
  end

  it "shows the teams deficit, the difference between actual and daily target"

end