class QuizzesController < ApplicationController

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  def quiz
    # Defaults to quiz 1, but should change once we implement user
    # should change to: Quiz.where(user_id: @user.id)
    @quiz = Quiz.find(1)
    redirect_to quizzes_path unless @quiz
    @question = Question.find(@quiz.current_question)
    @response = Response.new
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(current_question: 1)
    @question = Question.find(@quiz.current_question)
    @response = Response.new
    respond_to do |format|
      if @quiz.save
        cookies[:finished_quiz] = false
        format.js
      else
        format.js { flash[:alert] = 'There was a problem creating quiz.' }
      end
    end
  end

end
