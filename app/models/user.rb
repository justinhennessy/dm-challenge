class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  def activity_total
    activities.sum(:value)
  end

end
