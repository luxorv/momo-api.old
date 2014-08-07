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
    @entity = Entity.find(params[:id])

    render json: @entity
  end

  # POST /entities
  # POST /entities.json
  def create
    @entity = Entity.new(params[:entity])

    if @entity.save
      render json: @entity, status: :created, location: @entity
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entities/1
  # PATCH/PUT /entities/1.json
  def update
    @entity = Entity.find(params[:id])

    if @entity.update_attributes(params[:entity])
      head :no_content
    else
      render json: @entity.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entities/1
  # DELETE /entities/1.json
  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy

    head :no_content
  end
end
