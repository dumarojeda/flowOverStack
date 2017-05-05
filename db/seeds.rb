# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'



6.times do
  User.create(email: Faker::Internet.email, password: '123456')
end

users_ids = User.all.pluck(:id)

10 .times do |question|
  Question.create(name: Faker::HarryPotter.character, description: Faker::HarryPotter.quote, user_id: users_ids.sample)
end
questions_ids = Question.all.pluck(:id)

10.times do |answer|
  Answer.create(description: Faker::HarryPotter.quote, question_id: questions_ids.sample, user_id: users_ids.sample)
end
answers_ids = Answer.all.pluck(:id)


# 6.times do |vote|
#   newVote = Vote.new(quantity: rand(10))
#   newVote.update_attribute(:v_duty, Question.find(questions_ids.sample))
#   newVote.save
# end


# 6.times do |vote|
#   newVote = Vote.new(quantity: rand(10))
#   newVote.update_attribute(:v_duty, Answer.find(answers_ids.sample))
#   newVote.save
# end
