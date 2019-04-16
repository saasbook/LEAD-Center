class Response < ApplicationRecord
  belongs_to :question
  belongs_to :quiz
  serialize :categories, Array

  validates :question_id, presence: true
  validates :quiz_id, presence: true
  validates :categories, presence: true
end
