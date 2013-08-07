require 'spec_helper'

describe "Viewing a users activity list" do
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
    create_activity user: user, distance: 103, ascent: 10, date: 3.days.ago
  end

  it "shows a message saying there are no activities"

  it "shows a link to edit each activity"

  it "shows the list of activities for the current challenge" do
    visit user_activities_path(user)

    expect(page).to have_text(4.days.ago.to_date)
    expect(page).to have_text("104")
    expect(page).to have_text(3.days.ago.to_date)
    expect(page).to have_text("103")
  end

  it "shows a link for adding new activities" do
    visit user_activities_path(user)

    click_link 'Add'

    expect(current_path).to eq(new_user_activity_path(user))
  end
end
