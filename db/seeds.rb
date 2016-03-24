# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

5.times { User.create!(name: Faker::Name.name) }

Poll.create!(title: "Beers", user_id: User.all[0].id)
Poll.create!(title: "asdf", user_id: User.all[1].id)
Poll.create!(title: "asdfcvxcv", user_id: User.all[2].id)
Poll.create!(title: "Beasdflkjhs", user_id: User.all[3].id)
Poll.create!(title: "Beeaars", user_id: User.all[4].id)

Question.create!(text: "Favorite beer?", poll_id: Poll.first.id)
Question.create!(text: "Favorite malt?", poll_id: Poll.first.id)
Question.create!(text: "Favorite style?", poll_id: Poll.first.id)


(1..4).each do |x|
  3.times do
    Question.create!(text: Faker::Hipster.sentence(5), poll_id: Poll.all[x].id)
  end
end

Question.all.each_with_index do |question, i|
  if i < 3
    next
  end
  AnswerChoice.create!(question_id: question.id, choice: Faker::Superhero.power)
  AnswerChoice.create!(question_id: question.id, choice: Faker::Superhero.power)
  AnswerChoice.create!(question_id: question.id, choice: Faker::Superhero.power)
end

AnswerChoice.create!(question_id: Question.all[0].id, choice: Faker::Beer.name)
AnswerChoice.create!(question_id: Question.all[0].id, choice: Faker::Beer.name)
AnswerChoice.create!(question_id: Question.all[0].id, choice: Faker::Beer.name)

AnswerChoice.create!(question_id: Question.all[1].id, choice: Faker::Beer.malts)
AnswerChoice.create!(question_id: Question.all[1].id, choice: Faker::Beer.malts)
AnswerChoice.create!(question_id: Question.all[1].id, choice: Faker::Beer.malts)

AnswerChoice.create!(question_id: Question.all[2].id, choice: Faker::Beer.style)
AnswerChoice.create!(question_id: Question.all[2].id, choice: Faker::Beer.style)
AnswerChoice.create!(question_id: Question.all[2].id, choice: Faker::Beer.style)

Response.create!(answer_choice_id: AnswerChoice.first.id, user_id: User.all[0].id)
Response.create!(answer_choice_id: AnswerChoice.first.id, user_id: User.all[1].id)
Response.create!(answer_choice_id: AnswerChoice.first.id, user_id: User.all[2].id)
