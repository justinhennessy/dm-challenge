require 'spec_helper'

describe "Deleting an activity" do
  before(:each) do
    @user = create_user
    sign_in_as @user
  end

  it "deletes the selected activity then redirects to the activity list" do
    create_activity user: @user, distance: 104, date: 4.days.ago

    visit user_activities_path(@user)

    click_link 'Delete'

    expect(current_path).to eq(user_activities_path(@user))
    expect(page).not_to have_text('104')
    expect(page).to have_text("Activity successfully deleted!")
  end
end
