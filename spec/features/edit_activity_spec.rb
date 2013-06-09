require 'spec_helper'

describe "Editing an activity" do
  it "updates the activity then shows the activity list" do
    user      = create_user
    activity  = create_activity user: user, value: 104, date: 4.days.ago

    visit edit_user_activity_path(user, activity)

    fill_in "Value", with: 31

    click_button 'Update Activity'

    expect(current_path).to eq(user_activities_path(user))
    expect(page).to have_text('31')
    expect(page).to have_text('Activity successfully updated!')
  end

  it "doesnt update if the date of the activity is outside the challenge date"

  it "doesnt update if the activity value <= zero" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user, value: 104, date: 4.days.ago

    visit edit_user_activity_path(user, activity)

    fill_in "Value", with: 0

    click_button 'Update Activity'

    expect(page).to have_text('error')
  end
end