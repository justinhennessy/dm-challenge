class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  #validates :commitment, presence: true, :numericality => { greater_than: 0 }
  validates :name, presence: true

  def daily_average
    (commitment / challenge.total_days).to_i
  end

  def total_needed_to_date
    (challenge.start_date < Time.current.to_date) ? daily_average * (Time.current.to_date - challenge.start_date + 1).to_i : 0
  end

  def total_distance_for period
    activities.total_distance_between period
  end

  def total_ascent_for period
    activities.total_ascent_between period
  end

  def total_achievements_for period
    activities.total_achievements_between period
  end

  def activities_for period
    activities.between(period)
  end

  def percent_completed
    commitment ? ((total_distance_for(challenge.period).to_f / commitment) * 100).to_i : 0
  end

  def preferred_name
    nickname.presence || name
  end

  def highest_kilometers?
    challenge.user_with_highest_kilometers == self
  end

  def self.highest_kilometers_within_period period
    all.max { |a, b| a.activities.total_distance_between(period)\
      <=> b.activities.total_distance_between(period) }
  end

  def self.highest_ascent_within_period period
    all.max { |a, b| a.activities.total_ascent_between(period)\
      <=> b.activities.total_ascent_between(period) }
  end

  def self.highest_achievements_within_period period
    all.max { |a, b| a.activities.total_achievements_between(period)\
      <=> b.activities.total_achievements_between(period) }
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
