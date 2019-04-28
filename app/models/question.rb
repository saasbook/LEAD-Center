class Question < ApplicationRecord
  serialize :options, Hash
  serialize :next_question, Hash
  def question_queue_content(selected_options)
    question_ids = []
    content = []
    selected_options.each do |option|
      id = self.next_question[option]
      content << self.options[option]
      if id
        question_ids << id
      end
    end
    return {
      :question_ids => question_ids, 
      :content => content, 
      :response_type => self.response_type,
    }
  end
end
