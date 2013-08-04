require 'spec_helper'

describe "Viewing a users activity list" do
  before(:each) do
    @user = create_user
    sign_in_as @user
  end

  it "shows a message saying there are no activities"

  it "shows a link to edit each activity"
  #   challenge = create_challenge start_date: 10.days.ago,\
  #     end_date: 21.days.from_now
  #   @user.challenge = challenge
  #   activity1 = create_activity user: @user, distance: 104, date: 4.days.ago

  #   visit user_activities_path(@user)

  #  click_link 'Edit'

  #   expect(current_path).to\
  #     have_content(edit_user_activity_path(@user, activity1))
  # end

  it "shows the list of activities for the current challenge" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    @user.challenge = challenge
    create_activity user: @user, distance: 104, date: 4.days.ago
    create_activity user: @user, distance: 103, date: 3.day.ago

    visit user_activities_path(@user)

    expect(page).to have_text(4.days.ago.to_date)
    expect(page).to have_text("104")
    expect(page).to have_text(3.days.ago.to_date)
    expect(page).to have_text("103")
  end

  it "shows a link for adding new activities" do
    visit user_activities_path(@user)

    click_link 'Add'

    expect(current_path).to eq(new_user_activity_path(@user))
  end
end
