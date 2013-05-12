# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
start_date = Time.now - 5.days
end_date = start_date + 31.days

Challenge.create!([
  {
    name: "Kilometer Smash!",
    description:  "To make the most kilometers in 31 days",
    start_date:   start_date,
    end_date:     end_date
  }
])

User.create!([
  {
    name: "Justin Hennessy",
    email:  "justhennessy@gmail.com",
    commitment: 1500
  },
  {
    name: "Rhys",
    email:  "blah1@gmail.com",
    commitment: 1500
  },
  {
    name: "Kelly",
    email:  "blah2@gmail.com",
    commitment: 1500
  },
  {
    name: "Rae",
    email:  "blah3@gmail.com",
    commitment: 1000
  },
  {
    name: "Liam",
    email:  "blah4@gmail.com",
    commitment: 500
  },
])