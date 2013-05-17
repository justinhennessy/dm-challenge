require 'spec_helper'

describe "A user" do
  it "can show total number of activities all time" do
    user1 = FactoryGirl.create :user

    FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :activity, user: user1, value: 5, date: Time.now - 1.days

    expect(user1.activity_total).to eq(105)
  end  
end