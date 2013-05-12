require 'spec_helper'

describe "Viewing the dashboard" do

  it "shows the number of days until the challenge starts" do
    start_date = Time.now + 6.days
    end_date = start_date + 31.days

    challenge = Challenge.create(name:          "Kilometer Smash!",
                                  description:  "To make the most kilometers in 31 days",
                                  start_date:   start_date,
                                  end_date:     end_date)

    current_date = Time.now

    visit "/dashboard"

    expect(page).to have_text("5 days to start!")
  end

  it "shows the number of days left in a challenge once it has started" do
    start_date = Time.now - 10.days
    end_date = start_date + 31.days

    challenge = Challenge.create(name:          "Kilometer Smash!",
                                  description:  "To make the most kilometers in 31 days",
                                  start_date:   start_date,
                                  end_date:     end_date)

    current_date = Time.now

    visit "/dashboard"

    expect(page).to have_text("11 days left!")
  end

  it "shows the teams target for the current chanllenge"

  it "shows the teams accumulative total to date"

  it "shows the accumulative total need to hit chanllenge target to date"

  it "shows the teams deficit, the difference between actual and daily target"

end