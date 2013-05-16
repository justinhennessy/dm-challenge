# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Challenge.create!([
#   {
#     name: "Kilometer Smash!",
#     description:  "To make the most kilometers in 31 days",
#     start_date:   Time.now - 5.days,
#     end_date:     Time.now + 21.days
#   }
# ])

challenge = FactoryGirl.create :challenge

FactoryGirl.create :user, challenge: challenge, commitment: 1000
FactoryGirl.create :user, challenge: challenge, commitment: 400
FactoryGirl.create :user, challenge: challenge, commitment: 1000