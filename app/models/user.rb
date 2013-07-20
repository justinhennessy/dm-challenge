class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

  #validates :commitment, presence: true, :numericality => { greater_than: 0 }
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
    commitment ? ((sum_of_activities_for(challenge).to_f / commitment) * 100).to_i : 0
  end

  def preferred_name
    nickname.presence || name
  end

  def highest_kilometers?
    challenge.user_with_highest_kilometers == self
  end

  def self.from_omniauth(auth)
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
