class Challenge < ActiveRecord::Base
  has_many :users

  def target
    users.sum(:commitment)
  end

  def daily_average
    (target/total_days).to_i
  end

  def total_days
    (end_date - start_date).to_i
  end

  def target_needed_to_date
    (start_date < Time.now.to_date) ? daily_average * (Time.now.to_date - start_date + 1).to_i : 0
  end

  def accumulated_total
    users.inject(0) { |result, user| result + user_distance_sum(user) }
  end

  def deficit
    deficit = target_needed_to_date - accumulated_total
    deficit < 0 ? 0 : deficit
  end

  def user_with_highest_kilometers
    highest = User.new
    users.each do |user|
      highest = user if user_distance_sum(user) > user_distance_sum(highest)
    end
    highest
  end

  def user_with_highest_ascent
    highest = User.new
    users.each do |user|
      highest = user if user_ascent_sum(user) > user_ascent_sum(highest)
    end
    highest
  end

  def user_with_highest_achievements
    highest = User.new
    users.each do |user|
      highest = user if user_achievement_sum(user) > user_achievement_sum(highest)
    end
    highest
  end

  private

  def user_distance_sum(user)
    sum_stat(user, :distance)
  end

  def user_ascent_sum(user)
    sum_stat(user, :ascent)
  end

  def user_achievement_sum(user)
    sum_stat(user, :achievements)
  end

  def sum_stat(user, stat_to_sum)
    user.activities.where("date >= '" + start_date.to_s + "' and date <= '"\
      + end_date.to_s + "'").sum(stat_to_sum)
  end
end
