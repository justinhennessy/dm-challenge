class ActivitiesController < ApplicationController
  before_filter :authorize

  def index
    @challenge  = Challenge.last
    @user       = User.find(params[:user_id])
    @activities = @user.activities_for(@challenge.period)
  end

  def new
    @user     = User.find(params[:user_id])
    @activity = @user.activities.new
    @activity.date ||= DateTime.current.strftime("%Y-%m-%d")
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

  def edit
    @user = User.find(params[:user_id])
    @activity = @user.activities.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to user_activities_path(@user),\
        notice: "Activity successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @activity = Activity.find(params[:id])
    @activity.destroy!
    redirect_to user_activities_path(@user),\
      alert: "Activity successfully deleted!"
  end

    private

    def activity_params
      params.require(:activity).permit(:date, :distance, :ascent, :achievements)
    end
end
