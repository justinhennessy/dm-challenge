class User < ActiveRecord::Base
  belongs_to :challenge
  has_many :activities

end
