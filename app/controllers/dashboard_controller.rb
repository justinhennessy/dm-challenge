class DashboardController < ApplicationController
  def index
    @challenge = Challenge.first
  end
end
