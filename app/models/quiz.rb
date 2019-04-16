class Quiz < ApplicationRecord
  has_many :responses

  validates :current_question, presence: true
end
