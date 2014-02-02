class DashboardController < ApplicationController
  before_filter :authorize, only: [:index]

  def index
    @challenge = Challenge.last
  end
end
