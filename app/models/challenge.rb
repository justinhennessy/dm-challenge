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
    target_needed_to_date - accumulated_total
  end

  def user_with_highest_kilometers
    users.max { |a, b| user_distance_sum(a) <=> user_distance_sum(b) }
  end

  def user_with_highest_ascent
    users.max { |a, b| user_ascent_sum(a) <=> user_ascent_sum(b) }
  end

  def user_with_highest_achievements
    users.max { |a, b| user_achievement_sum(a) <=> user_achievement_sum(b) }
  end

  def participant_with_highest_kilometers
    users.highest_km_for(period)
  end

  def period
    OpenStruct.new(start: start_date, finish: end_date)
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
