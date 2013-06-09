class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  validates :commitment, presence: true, :numericality => { greater_than: 0 }
  validates :name, presence: true

  def sum_of_activities_for(challenge)
    start_date = challenge.start_date
    end_date   = challenge.end_date

    activities.where("date >= '" + start_date.to_s + "' and date <= '"\
      + end_date.to_s + "'").sum(:value)
  end

  def activities_for(challenge)
    start_date = challenge.start_date
    end_date   = challenge.end_date

    activities.where("date >= '" + start_date.to_s + "' and date <= '"\
      + end_date.to_s + "'")
  end

  def percent_completed
    ((sum_of_activities_for(challenge).to_f / commitment) * 100).to_i
  end

  def preferred_name
    nickname.presence || name
  end

  def highest_kilometers?
    challenge.user_with_highest_kilometers == self
  end
end
