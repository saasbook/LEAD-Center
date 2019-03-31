class Question < ApplicationRecord
  serialize :options, Hash
  serialize :next_question, Hash
end
