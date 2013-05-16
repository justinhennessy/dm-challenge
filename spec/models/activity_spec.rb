require 'spec_helper'

describe Activity do
    it "can show total number of activities all time for a particular user" do
    user1 = FactoryGirl.create :user

    FactoryGirl.create :actvitiy, user: user1, value: 100, date: Time.now - 2.days
    FactoryGirl.create :actvitiy, user: user1, value: 5, date: Time.now - 1.days

    expect(activity.total)
  end

  it "can show the total of activities within a challenge"
end
