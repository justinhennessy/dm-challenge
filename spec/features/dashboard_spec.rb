require 'spec_helper'

describe "Viewing the dashboard" do

  it "shows a list of team members and their stats" do
    challenge = FactoryGirl.create :challenge, start_date: Time.now - 10.days, end_date: Time.now + 21.days

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user1, value: 5, date: Time.now - 1.days
    FactoryGirl.create :activity, user: user2, value: 50, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user2, value: 200, date: Time.now - 1.days

    visit dashboard_path

    expect(page).to have_text(user1.prefered_name)
    expect(page).to have_text(user2.prefered_name)

    expect(page).to have_text(user1.activity_total)
    expect(page).to have_text(user2.activity_total)

    expect(page).to have_text(user1.percent_completed)
    expect(page).to have_text(user2.percent_completed)
  end

  it "shows the number of days until the challenge starts" do
    future_challenge = FactoryGirl.create :challenge, start_date: Time.now + 12.days, end_date: Time.now + 30.days

    visit dashboard_path

    expect(page).to have_text("12 days to start!")
  end

  it "shows the number of days left in a challenge once it has started" do
    challenge = FactoryGirl.create :challenge

    visit dashboard_path

    expect(page).to have_text("21 days left!")
  end

  it "shows the teams target for the current challenge" do
    challenge = FactoryGirl.create :challenge

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    visit dashboard_path

    expect(page).to have_text("1500 Challenge Total")
  end

  it "shows the teams accumulative total to date" do
    challenge = FactoryGirl.create :challenge, start_date: Time.now - 10.days, end_date: Time.now + 21.days

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user1, value: 5, date: Time.now - 1.days
    FactoryGirl.create :activity, user: user2, value: 50, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user2, value: 200, date: Time.now - 1.days

    visit dashboard_path

    expect(page).to have_text("355 Team Total")
  end

  it "shows the accumulative total needed to hit challenge target to date" do
    challenge = FactoryGirl.create :challenge, start_date: Time.now - 10.days, end_date: Time.now + 21.days

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 500

    visit dashboard_path

    expect(page).to have_text("480 Needed")
  end

  it "shows the teams deficit, the difference between actual and daily target" do
    challenge = FactoryGirl.create :challenge, start_date: Time.now - 10.days, end_date: Time.now + 21.days

    user1 = FactoryGirl.create :user, challenge: challenge, commitment: 2000
    user2 = FactoryGirl.create :user, challenge: challenge, commitment: 1500

    FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user1, value: 5, date: Time.now - 1.days
    FactoryGirl.create :activity, user: user2, value: 50, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user2, value: 200, date: Time.now - 1.days

    visit dashboard_path

    expect(page).to have_text("765 Deficit")
  end

  it "shows a users prefered name in place of name" do
    user1 = FactoryGirl.create :user, nickname: "Drill Sergeant"

    visit dashboard_path

    expect(page).to have_text(user1.nickname)
  end

  it "shows a link that a user can click to see a list of their activities for the current challenge" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user1     = create_user challenge: challenge, commitment: 2000
    user2     = create_user challenge: challenge, commitment: 1500
    create_activity user: user1, value: 100, date: 2.days.ago
    create_activity user: user1, value: 5, date: 1.day.ago

    visit dashboard_path
    click_link user1.prefered_name

    expect(current_path).to eq(user_activities_path(user1))
    expect(page).to have_text(user1.prefered_name)
    expect(page).to have_text(user1.activities.first.value)
    expect(page).to have_text(user1.activities.first.date)
    expect(page).to have_text(user1.activities.last.value)
    expect(page).to have_text(user1.activities.last.date)
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