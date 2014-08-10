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
    @network = KiWi.show_network params[:id]

    render json: @network
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(params[:network])

    if @network.save
      render json: @network, status: :created, location: @network
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /networks/1
  # PATCH/PUT /networks/1.json
  def update
    @network = Network.find(params[:id])

    if @network.update_attributes(params[:network])
      head :no_content
    else
      render json: @network.errors, status: :unprocessable_entity
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network = Network.find(params[:id])
    @network.destroy

    head :no_content
  end
end
