class ActivitiesController < ApplicationController
  def index
    @user       = User.find(params[:user_id])
    @challenge  = Challenge.find(@user)
    @activities = @user.activities_for(@challenge)
  end

  def new
    @user     = User.find(params[:user_id])
    @activity = @user.activities.new
  end

  def create
    @user     = User.find(params[:user_id])
    @activity = @user.activities.new(activity_params)
    if @activity.save
      redirect_to user_activities_path(@user),\
        notice: "Activity successfully created!"
    else
      render :new
    end
  end

    private

    def activity_params
      params.require(:activity).permit(:date, :value)
    end
end
