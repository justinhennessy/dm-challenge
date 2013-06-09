require 'spec_helper'

describe "Deleting an activity" do
  it "deletes the selected activity then redirects to the activity list" do
    user      = create_user
    create_activity user: user, value: 104, date: 4.days.ago

    visit user_activities_path(user)

    click_link 'Delete'

    expect(current_path).to eq(user_activities_path(user))
    expect(page).not_to have_text('104')
    expect(page).to have_text("Activity successfully deleted!")
  end
end
