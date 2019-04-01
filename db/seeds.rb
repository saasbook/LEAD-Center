# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Question.create(
    title: 'Are you interested in Athletics?',
    options: {
      'yes' => ['Sports', 'Wellness', 'Outdoors'],
      'no' => ['Food', 'Indoors']
    },
    next_question: {
      'yes' => 2,
      'no' => 3
    },
    can_skip: false
  )
  Question.create(
    title: 'Which of the following appeals the most to you?',
    options: {
      'Video Games' => ['Gaming'],
      'Hiking' => ['Sports', 'Nature'],
      'Cooking' => ['Food']
    },
    next_question: {
      'Video Games' => 3,
      'Hiking' => 4,
      'Cooking' => 5
    },
    can_skip: true
  )
  Question.create(
    title: 'Are you interested in Greek Life?',
    options: {
      'yes' => ['Greek', 'Professional', 'Business'],
      'no' => ['Food', 'Indoors']
    },
    next_question: {
      'yes' => 2,
      'no' => 3
    },
    can_skip: false
  )
