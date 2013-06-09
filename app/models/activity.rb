class Activity < ActiveRecord::Base
  belongs_to :user

  validates :value, presence: true, :numericality => { greater_than: 0 }
  validates :date, presence: true

end
