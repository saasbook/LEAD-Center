Question.create(
  title: 'Are you interested in Athletics?',
  options: {
    'yes' => ['Sports', 'Wellness', 'Outdoors'],
    'no' => ['Food', 'Indoors']
  },
  next_question: {
    'yes' => 2,
    'no' => 2
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
    'Hiking' => 3,
    'Cooking' => 3
  },
  can_skip: true
)