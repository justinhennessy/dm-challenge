class Challenge < ActiveRecord::Base
  has_many :users

  def target
    users.sum(:commitment)
  end

  def daily_average
    (target / total_days).to_i
  end

  def total_days
    (end_date - start_date).to_i
  end

  def target_needed_to_date
    (start_date < Time.now.to_date) ? daily_average * (Time.now.to_date - start_date + 1).to_i : 0
  end

  def accumulated_total
    users.inject(0) { |result, user| result + user.total_distance_for(period) }
  end

  def deficit
    target_needed_to_date - accumulated_total
  end

  def user_with_highest_kilometers
    users.highest_kilometers_within_period period
  end

  def user_with_highest_ascent
    users.highest_ascent_within_period period
  end

  def user_with_highest_achievements
    users.highest_achievements_within_period period
  end

  def period
    # TODO - change to start_date..end_date
    OpenStruct.new(start: start_date, finish: end_date)
  end
end
