require 'spec_helper'

describe "Viewing a users activity list" do
  it "shows a link to edit each activity" do

  end

  it "shows the list of activities for the current challenge" do
    challenge = create_challenge start_date: 10.days.ago, end_date: 21.days.from_now
    user = create_user challenge: challenge
    create_activity user: user, value: 104, date: 4.days.ago
    create_activity user: user, value: 103, date: 3.day.ago

    visit user_activities_path(user)

    expect(page).to have_text(4.days.ago.to_date)
    expect(page).to have_text("104")
    expect(page).to have_text(3.days.ago.to_date)
    expect(page).to have_text("103")
  end

  it "shows a link for adding new activities" do
    user = create_user

    visit user_activities_path(user)

    click_link 'Add'

    expect(current_path).to eq(new_user_activity_path(user))
  end
end
