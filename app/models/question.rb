class Question < ApplicationRecord
  serialize :options, Hash
  serialize :next_question, Hash
  def question_queue_content(selected_options)
    question_queue = []
    content = []
    selected_options.each do |option|
      id = self.next_question[option]
      # content << self.options[option]
      content = content.concat self.options[option]
      if id
        question_queue << id
      end
    end
    return {
      :question_queue => question_queue, 
      :content => content, 
      :question_type => self.question_type,
    }
  end
end
