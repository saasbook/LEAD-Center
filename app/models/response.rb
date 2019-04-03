class Response < ApplicationRecord
  belongs_to :question
  belongs_to :quiz
  serialize :categories, Array
end
