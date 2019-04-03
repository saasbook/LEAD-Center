class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
    @quiz = Quiz.new
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
    # Get the quiz id from user, defaults to user 1
    @quiz = Quiz.find(1)
    redirect_to quizzes_path unless @quiz
    @question = Question.find(@quiz.current_question)
    @response = Response.new
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  def quiz
    @quiz = Quiz.find(1)
    redirect_to quizzes_path unless @quiz
    @question = Question.find(@quiz.current_question)
    @response = Response.new
    respond_to do |format|
      format.html {}
    end
  end

  # GET /quizzes/1/edit
  def edit
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
        format.html {}
        format.json { render json: @question }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.fetch(:quiz, {})
    end
end
