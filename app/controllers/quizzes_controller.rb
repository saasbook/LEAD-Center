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
        format.js
      else
        flash[:notice] = "There was a problem creating quiz."
        format.html { redirect_to root_path }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.fetch(:quiz, {})
    end
end
