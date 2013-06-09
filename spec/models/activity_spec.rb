require 'spec_helper'

describe "An activity" do
  it "must have a value greater than zero" do
    activity = Activity.new(value: 0, date: 1.days.ago)

    expect(activity.valid?).to be_false
    expect(activity.errors[:value].first).to eq("must be greater than 0")
  end
  it "must not have a blank value" do
    activity = Activity.new(date: 1.days.ago)

    expect(activity.valid?).to be_false
    expect(activity.errors[:value].first).to eq("can't be blank")
  end

  it "must not have a blank date" do
    activity = Activity.new(value: 100)

    expect(activity.valid?).to be_false
    expect(activity.errors[:date].first).to eq("can't be blank")
  end
end
