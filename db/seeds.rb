challenge = FactoryGirl.create :challenge

user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
user2 = FactoryGirl.create :user, challenge: challenge, commitment: 400
user3 = FactoryGirl.create :user, challenge: challenge, commitment: 1000

FactoryGirl.create :activity, user: user1, distance: 100,
                    date: Time.current - 3.days
FactoryGirl.create :activity, user: user1, distance: 100,
                    date: Time.current - 2.days
FactoryGirl.create :activity, user: user1, distance: 100,
                    date: Time.current - 1.days

FactoryGirl.create :activity, user: user2, distance: 200,
                    date: Time.current - 3.days
FactoryGirl.create :activity, user: user2, distance: 200,
                    date: Time.current - 2.days
FactoryGirl.create :activity, user: user2, distance: 200,
                    date: Time.current - 1.days

FactoryGirl.create :activity, user: user3, distance: 300,
                    date: Time.current - 3.days
FactoryGirl.create :activity, user: user3, distance: 300,
                    date: Time.current - 2.days
FactoryGirl.create :activity, user: user3, distance: 300,
                    date: Time.current - 1.days
