class Challenge < ActiveRecord::Base
  has_many :users

  def target
    users.sum(:commitment)
  end
end
