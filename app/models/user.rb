class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  def activity_total
    activities.sum(:value)
  end

  def percent_completed
    ((activity_total.to_f / commitment) * 100).to_i
  end
end
