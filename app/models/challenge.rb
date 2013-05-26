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
    daily_average * (Time.now.to_date - start_date).to_i
  end

  def accumulated_total
    users.inject(0) { |result, user| result + user.activity_total }
  end

  def deficit
    deficit = target_needed_to_date - accumulated_total
    deficit < 0 ? 0 : deficit
  end

  def user_with_yellow_jersey
    users.sort_by(&:activity_total).last
  end
end
