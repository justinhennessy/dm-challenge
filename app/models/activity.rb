class Activity < ActiveRecord::Base
  belongs_to :user

  validates :distance, presence: true, :numericality => { greater_than: 0 }
  validates :date, presence: true

  def self.total_stat_between(period, stat_to_sum)
    between(period).sum(stat_to_sum)
  end

  def self.between(period)
    where("date >= ? and date <= ?", period.start, period.finish)
  end
end
