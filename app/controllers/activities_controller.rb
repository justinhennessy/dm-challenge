class ActivitiesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @activities = @user.activities
  end
end
