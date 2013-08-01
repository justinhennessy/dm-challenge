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
    (start_date < Time.now.to_date) ? daily_average * (Time.now.to_date - start_date).to_i : 0
  end

  def accumulated_total
    users.inject(0) { |result, user| result + user_activity_sum(user) }
  end

  def deficit
    deficit = target_needed_to_date - accumulated_total
    deficit < 0 ? 0 : deficit
  end

  def user_with_highest_kilometers
  highest = User.new
  users.each do |user|
    highest = user if user_activity_sum(user) > user_activity_sum(highest)
  end
  highest
  end

  private

  def user_activity_sum(user)
    user.activities.where("date >= '" + start_date.to_s + "' and date <= '"\
      + end_date.to_s + "'").sum(:distance)
  end
end
