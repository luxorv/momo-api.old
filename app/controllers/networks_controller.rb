class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.json
  def index
    @networks = Network.all

    render json: @networks
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
    @network = Finder.find_network_by_id params[:id]
    @network ||= KiWi.show_network params[:id]

    render json: @network
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Pusher.create_network(params[:network])

    if @network.valid?
      render json: @network, status: :created, location: @network
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    @network = Pusher.update_network(params)

    if @network.valid?
      head :no_content
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network = Pusher.destroy_network(params)

    head :no_content
  end
end
