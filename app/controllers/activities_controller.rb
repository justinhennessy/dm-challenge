class ActivitiesController < ApplicationController
  def index
    @user       = User.find(params[:user_id])
    @challenge  = Challenge.find(@user)
    @activities = @user.activities_for(@challenge)
  end
end
