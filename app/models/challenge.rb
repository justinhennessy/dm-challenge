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
    target_needed_to_date - accumulated_total
  end
end
