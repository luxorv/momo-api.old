class StudiosController < ApplicationController
  # GET /studios
  # GET /studios.json
  def index
    @studios = Studio.all

    render json: @studios
  end

  # GET /studios/1
  # GET /studios/1.json
  def show
    @studio = Studio.find(params[:id])

    render json: @studio
  end

  # POST /studios
  # POST /studios.json
  def create
    @studio = Studio.new(params[:studio])

    if @studio.save
      render json: @studio, status: :created, location: @studio
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studios/1
  # PATCH/PUT /studios/1.json
  def update
    @studio = Studio.find(params[:id])

    if @studio.update_attributes(params[:studio])
      head :no_content
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studios/1
  # DELETE /studios/1.json
  def destroy
    @studio = Studio.find(params[:id])
    @studio.destroy

    head :no_content
  end
end
