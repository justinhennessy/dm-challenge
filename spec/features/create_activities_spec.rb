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
end
