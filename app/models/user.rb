class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  #validates :commitment, presence: true, :numericality => { greater_than: 0 }
  validates :name, presence: true

  def sum_of_distance_for period
    activities.total_stat_between(challenge.period, :distance)
  end

  def sum_of_ascent_for period
    activities.total_stat_between(challenge.period, :ascent)
  end

  def sum_of_achievements_for period
    activities.total_stat_between(challenge.period, :achievements)
  end

  def activities_for period
    activities.list(period)
  end

  def percent_completed
    commitment ? ((sum_of_distance_for(challenge).to_f / commitment) * 100).to_i : 0
  end

  def preferred_name
    nickname.presence || name
  end

  def highest_kilometers?
    challenge.user_with_highest_kilometers == self
  end

  def self.highest users, stat_to_sum, period
    users.max { |a, b| a.activities.total_stat_between(period,stat_to_sum)\
      <=> b.activities.total_stat_between(period, stat_to_sum)}
  end

  def self.from_omniauth auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.challenge = Challenge.first
      #user.commitment = 500
      user.save!
    end
  end
end
