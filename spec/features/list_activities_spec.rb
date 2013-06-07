require 'spec_helper'

describe "Viewing a users activity list" do
  it "shows the users name at the top of the list"

  it "shows the list of activities for the current challenge"

  it "shows a link for adding new activities" do
    user = create_user

    visit user_activities_path(user)

    click_link 'Add'

    expect(current_path).to eq(new_user_activity_path(user))
  end
end
