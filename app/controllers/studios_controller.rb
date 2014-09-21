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
    @studio = KiWi.show_studio params[:id]

    render json: @studio
  end

  # POST /studios
  # POST /studios.json
  def create
    @studio = Pusher.create_studio(params[:studio])

    if @studio.valid?
      render json: @studio, status: :created, location: @studio
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /studios/1
  # PATCH/PUT /studios/1.json
  def update
    @studio = Pusher.update_studio(params)

    if @studio.valid?
      head :no_content
    else
      render json: @studio.errors, status: :unprocessable_entity
    end
  end

  # DELETE /studios/1
  # DELETE /studios/1.json
  def destroy
    @studio = Pusher.destroy_studio(params)

    head :no_content
  end
end
