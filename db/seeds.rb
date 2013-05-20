challenge = FactoryGirl.create :challenge

user1 = FactoryGirl.create :user, challenge: challenge, commitment: 1000
user2 = FactoryGirl.create :user, challenge: challenge, commitment: 400
user3 = FactoryGirl.create :user, challenge: challenge, commitment: 1000

FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 3.days
FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 2.days
FactoryGirl.create :activity, user: user1, value: 100, date: Time.now - 1.days

FactoryGirl.create :activity, user: user2, value: 100, date: Time.now - 3.days
FactoryGirl.create :activity, user: user2, value: 100, date: Time.now - 2.days
FactoryGirl.create :activity, user: user2, value: 100, date: Time.now - 1.days

FactoryGirl.create :activity, user: user3, value: 100, date: Time.now - 3.days
FactoryGirl.create :activity, user: user3, value: 100, date: Time.now - 2.days
FactoryGirl.create :activity, user: user3, value: 100, date: Time.now - 1.days