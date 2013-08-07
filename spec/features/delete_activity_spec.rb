require 'spec_helper'

describe "Deleting an activity" do
  let(:commitment) { 1000 }
  let(:challenge) {
    create_challenge start_date: 10.days.ago,
      end_date: 21.days.from_now
  }
  let(:user) {
    create_user challenge: challenge, commitment: commitment
  }

  before(:each) do
    sign_in_as user
    create_activity user: user, distance: 104, ascent: 20, date: 4.days.ago
  end

  it "deletes the selected activity then redirects to the activity list" do
    visit user_activities_path(user)

    click_link 'Delete'

    expect(current_path).to eq(user_activities_path(user))
    expect(page).not_to have_text('104')
    expect(page).to have_text("Activity successfully deleted!")
  end
end
