require 'spec_helper'

describe "Viewing the dashboard" do
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
  end

  context "with a second team member and some activity" do
    let(:user2_commitment) { 500 }
    let(:user2) {
      create_user challenge: challenge,
        commitment: user2_commitment
     }

    before(:each) do
      create_activity user: user, distance: 100, ascent: 20, date: 2.days.ago.utc
      create_activity user: user, distance: 5, ascent: 10, date: 1.day.ago.utc
      create_activity user: user2, distance: 50, ascent: 1, date: 2.days.ago.utc
      create_activity user: user2, distance: 200, ascent: 1, date: 1.day.ago.utc
    end

    it "shows a yellow jersey on the individual with the most kms" do

      visit dashboard_path

      # TODO: need to find out how to check that this is next to the person
      # with the most kms
      #expect(page.find("tr." + user2.id.to_s + " td:first")).to have("img[src$='yellow_jersey_small.png']")
      expect(page).to have_selector("img[src$='yellow_jersey_small.png']")
    end

    it "shows a spotted jersey on the individual with the most meters ascented" do
      visit dashboard_path

      expect(page).to have_selector("img[src$='spotted_jersey_small.png']")
    end

    it "shows a list of team members and their stats" do
      visit dashboard_path

      expect(page).to have_text(user.preferred_name)
      expect(page).to have_text(user2.preferred_name)
      expect(page).to have_text(user.sum_of_distance_for(challenge))
      expect(page).to have_text(user2.sum_of_distance_for(challenge))
      expect(page).to have_text(user.percent_completed)
      expect(page).to have_text(user2.percent_completed)
    end

    it "shows a sum of meters ascented" do
      visit dashboard_path

      expect(page).to have_text(user.sum_of_ascent_for(challenge))
    end

    it "shows the number of days left in a challenge once it has started" do
      visit dashboard_path

      expect(page).to have_text("21 days left!")
    end

    it "shows the teams target for the current challenge" do
      visit dashboard_path

      expect(page).to have_text("1500 Challenge Total")
    end

    it "shows the teams accumulative total to date" do
      visit dashboard_path

      expect(page).to have_text("355 Team Total")
    end

    it "shows the accumulative total needed to hit challenge target to date" do
      visit dashboard_path

      expect(page).to have_text("528 Total needed to date")
    end

    it "shows the deficit, the difference between actual and daily target" do
      visit dashboard_path

      expect(page).to have_text("173 Deficit")
    end

    it "shows a link that a user can click to see a list of their activities for the current challenge"

    context "with a nickname" do
      let(:user) {
        create_user challenge: challenge, commitment: commitment,
          nickname: "Drill Sergeant"
      }

      it "shows a users prefered name in place of name" do
        visit dashboard_path

        expect(page).to have_text(user.nickname)
      end
    end
  end

  it "shows a summary page for the challenge when it is closed"

  context "with a challenge in the future" do
    let(:challenge) {
      create_challenge start_date: 12.days.from_now.utc,
        end_date: 30.days.from_now.utc
    }

    it "shows the number of days until the challenge starts" do
      visit dashboard_path

      expect(page).to have_text("12 days to start!")
    end

    it "shows 0 Team needed to date if the challenge hasn't started" do
      visit dashboard_path

      expect(page).to have_text("0 Total needed to date")
    end
  end
end
