require 'spec_helper.rb'

describe "Creating a new activity" do
  before(:each) do
    @user = create_user
    sign_in_as @user
  end

  it "saves the activity with distance and shows the user activity list" do
    visit new_user_activity_path(@user)

    fill_in "Date", with: 1.days.ago
    fill_in "Distance", with: 31

    click_button 'Create Activity'

    expect(current_path).to eq(user_activities_path(@user))
    expect(page).to have_text('31')
    expect(page).to have_text('Activity successfully created!')
  end

  it "saves the activity with ascent shows the user activity list" do
    visit new_user_activity_path(@user)

    fill_in "Date", with: 1.days.ago
    fill_in "Distance", with: 31
    fill_in "Ascent", with: 390

    click_button 'Create Activity'

    expect(current_path).to eq(user_activities_path(@user))
    expect(page).to have_text('390')
    expect(page).to have_text('Activity successfully created!')
  end

  it "saves the activity with achievements shows the user activity list" do
    visit new_user_activity_path(@user)

    fill_in "Date", with: 1.days.ago
    fill_in "Distance", with: 31
    fill_in "Achievements", with: 99

    click_button 'Create Activity'

    expect(current_path).to eq(user_activities_path(@user))
    expect(page).to have_text('99')
    expect(page).to have_text('Activity successfully created!')
  end

  it "with a distance = zero produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user, distance: 104, date: 4.days.ago

    visit new_user_activity_path(user)

    fill_in "Distance", with: 0
    fill_in "Date", with: 1.day.ago

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end

  it "with a distance less than zero produces an error" do
    challenge = create_challenge start_date: 10.days.ago,\
      end_date: 21.days.from_now
    user      = create_user challenge: challenge
    activity  = create_activity user: user, distance: 104, date: 4.days.ago

    visit new_user_activity_path(user)

    fill_in "Distance", with: -1
    fill_in "Date", with: 1.day.ago

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end

  it "with a distance = blank produces an error" do
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

    fill_in "Date", with: nil
    fill_in "Distance", with: 10

    click_button 'Create Activity'

    expect(page).to have_text('error')
  end
end
