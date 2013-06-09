require 'spec_helper'

describe "Creating a new activity" do
  it "saves the activity and shows the user activity list" do
    user = create_user

    visit new_user_activity_path(user)

    fill_in "Date", with: 1.days.ago
    fill_in "Value", with: 31

    click_button 'Create Activity'

    expect(current_path).to eq(user_activities_path(user))
    expect(page).to have_text('31')
    expect(page).to have_text('Activity successfully created!')
  end

  it "with a value = zero produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user, value: 104, date: 4.days.ago

    visit new_user_activity_path(user)

    fill_in "Value", with: 0
    fill_in "Date", with: 1.day.ago

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end

  it "with a value less than zero produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user, value: 104, date: 4.days.ago

    visit new_user_activity_path(user)

    fill_in "Value", with: -1
    fill_in "Date", with: 1.day.ago

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end

  it "with a value = blank produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user

    visit new_user_activity_path(user)

    fill_in "Date", with: 5.days.ago

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end

  it "with a blank date produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user

    visit new_user_activity_path(user)

    fill_in "Value", with: 10

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end
end
