class ProducersController < ApplicationController
  # GET /producers
  # GET /producers.json
  def index
    @producers = Producer.all

    render json: @producers
  end

  # GET /producers/1
  # GET /producers/1.json
  def show
    @producer = KiWi.show_producer params[:id]

    render json: @producer
  end

  # POST /producers
  # POST /producers.json
  def create
    @producer = Pusher.create_producer(params[:producer])

    if @producer.valid?
      render json: @producer, status: :created, location: @producer
    else
      render json: @producer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /producers/1
  # PATCH/PUT /producers/1.json
  def update
    @producer = Pusher.update_producer(params)

    if @producer.valid?
      head :no_content
    else
      render json: @producer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /producers/1
  # DELETE /producers/1.json
  def destroy
    @producer = Pusher.destroy_producer(params)

    head :no_content
  end
end
