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
    @response = Response.new(responses_params)

    respond_to do |format|
      if @response.save
        format.html { render json: Question.find(responses_params[:next_question]) }
        format.json { render json: Question.find(responses_params[:next_question]) }
        # format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end


end
