# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create({username: 'John'})
user2 = User.create({username: 'Marry'})
user3 = User.create({username: 'Jenna'})

poll1 = Poll.create( {author_id: user1.id, title: "Biggest Country"} )
poll2 = Poll.create( {author_id: user2.id, title: "Tallest building"} )


question1 = Question.create({ question: 'What is Biggest Country', poll_id: poll1.id })
question2 = Question.create({ question: 'Tallest building', poll_id: poll2.id })

answer11 = AnswerChoice.create({answer: 'America', question_id: question1.id})
answer12 = AnswerChoice.create({answer: 'China', question_id: question1.id})
answer13 = AnswerChoice.create({answer: 'Russia', question_id: question1.id})

answer21 = AnswerChoice.create({answer: 'Pyramids', question_id: question2.id})
answer22 = AnswerChoice.create({answer: 'CN Tower', question_id: question2.id})
answer23 = AnswerChoice.create({answer: 'Series tOWER', question_id: question2.id})

response11 = Response.create({ question_id: question1.id, answer_id: answer11.id, user_id: user3.id })
response11 = Response.create({ question_id: question1.id, answer_id: answer12.id, user_id: user2.id })

response21 = Response.create({ question_id: question2.id, answer_id: answer22.id, user_id: user2.id })
response21 = Response.create({ question_id: question2.id, answer_id: answer23.id, user_id: user1.id })


Response.create({ question_id: 1, answer_id: 1, user_id: 1 })





