class Activity < ActiveRecord::Base
  belongs_to :user

  validates :distance, presence: true, :numericality => { greater_than: 0 }
  validates :date, presence: true

  def self.total_distance_between(period)
    between(period).sum(:distance)
  end

  def self.total_ascent_between(period)
    between(period).sum(:ascent)
  end

  def self.total_achievements_between(period)
    between(period).sum(:achievements)
  end

  def self.between(period)
    where("date >= ? and date <= ?", period.start, period.finish)
  end

  def self.list(period)
    where("date >= ? and date <= ?", period.start, period.finish)
  end
end
