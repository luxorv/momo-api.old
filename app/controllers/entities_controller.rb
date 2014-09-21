class EntitiesController < ApplicationController
  # GET /entities
  # GET /entities.json
  def index
    @entities = Entity.all

    render json: @entities
  end

  # GET /entities/1
  # GET /entities/1.json
  def show
    @entity = KiWi.show_entity params[:id]

    render json: @entity
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Pusher.create_entity(params[:entity])

    if @entity.valid?
      render json: @entity, status: :created, location: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    @entity = Pusher.update_entity(params)

    if @entity.valid?
      head :no_content
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity = Pusher.destroy_entity(params)

    head :no_content
  end
end
