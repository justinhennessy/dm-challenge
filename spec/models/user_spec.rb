require 'spec_helper'

describe "A user" do
  it "can show total number of activities all time" do
    user = create_user commitment: 1000

    create_activity user: user, value: 100, date: 2.days.ago
    create_activity user: user, value: 5, date: 1.day.ago

    expect(user.activity_total).to eq(105)
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

    expect(user1.yellow_jersey?).to eq(TRUE)
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