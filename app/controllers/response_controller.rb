class ResponseController < ApplicationController

  # GET /response/new
  def new
    @response = Response.new
  end

  # GET /response/1/edit
  def edit
  end

  # POST /response
  # POST /response.json
  def create
    #params contains question id and categories
    question = Question.find(params[:question_id])
    categories = question.options[params[:selected_option]]
    next_question = question.next_question[params[:selected_option]]
    @question = Question.find(next_question)
    @response = Response.new
    responses_params = {
      :question_id => question.id,
      :categories => categories,
      :quiz_id => 1
    }
    @response = Response.new(responses_params)
    # binding.pry
    respond_to do |format|
      if @response.save
        format.html { render :partial => 'questions/form' }
        format.json { render json: @question }
        # format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end


end
