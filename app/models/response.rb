class Response < ApplicationRecord
  belongs_to :question
  belongs_to :quiz
  serialize :content, Array

  validates :question_id, presence: true
  validates :quiz_id, presence: true
  validates :content, presence: true
end
