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
    # next_question = question.next_question[params[:selected_option]]
    queue_content = question.question_queue_content(params[:selected_options])
    next_question = @quiz.update_quiz_state(queue_content[:question_queue])
    # TODO: Update the current question of quiz belonging to user
    if next_question.nil?
      @question = nil
    else
      @question = Question.find(next_question)
    end
    @response = Response.new
    responses_params = {
      :question_id => question.id,
      :content => queue_content[:content],
      :quiz_id => @quiz.id,
      :is_category => queue_content[:question_type] == 'categories'
    }
    @response = Response.new(responses_params)
    respond_to do |format|
      if @response.save
        format.html { render :partial => 'questions/form' }
        format.json { render json: @question }
        format.js
        # format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # TODO: add strong parameters to response create
end
