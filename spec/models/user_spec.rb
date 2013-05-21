require 'spec_helper'

describe "A user" do
  it "can show total number of activities all time" do
    user = FactoryGirl.create :user

    FactoryGirl.create :activity, user: user, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user, value: 5, date: Time.now - 1.days

    expect(user.activity_total).to eq(105)
  end

  it "can show the % completed of a commitment" do
    user = FactoryGirl.create :user, commitment: 1000

    FactoryGirl.create :activity, user: user, value: 100
    FactoryGirl.create :activity, user: user, value: 100

    expect(user.percent_completed).to eq(20)
  end
end