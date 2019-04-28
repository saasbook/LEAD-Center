class ResponseController < ApplicationController

  # GET /response/new
  def new
    @response = Response.new
  end

  # POST /response
  # POST /response.json
  def create
    @quiz = Quiz.find(params[:quiz_id])
    #params contains question id and categories
    question = Question.find(params[:question_id])
    content = question.options[params[:selected_options]]
    queue_content = question.question_queue_content(params[:selected_options])
    # Create response from question
    responses_params = {
      :question_id => question.id,
      :content => queue_content[:content],
      :quiz_id => @quiz.id,
      :is_category => queue_content[:question_type] == 'categories'
    }
    @response = Response.new(responses_params)
    respond_to do |format|
      if @response.save
        # If response successfully saves, then update the quiz and get next question.
        next_question = @quiz.update_quiz_state(queue_content[:question_queue])
        if next_question.nil?
          @question = nil
        else
          @question = Question.find(next_question)
        end
        format.js
      else
        # If response fails to save, then show the same question to retry.
        @question = question
        format.js { flash.now[:alert] = 'There was a problem answering question. Please try again.' }
      end
    end
  end

  # TODO: add strong parameters to response create
end
