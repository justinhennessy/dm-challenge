class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  def activity_total
    activities.sum(:value)
  end

  def percent_completed
    ((activity_total.to_f / commitment) * 100).to_i
  end

  def preferred_name
    nickname.presence || name
  end

  def yellow_jersey?
    challenge.user_with_yellow_jersey == self
  end
end
