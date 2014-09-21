class OtakusController < ApplicationController

  acts_as_token_authentication_handler_for Otaku, :except => [:index,:show]

  # GET /otakus
  # GET /otakus.json
  def index
    @otakus = Otaku.all

    render json: @otakus
  end

  # GET /otakus/1
  # GET /otakus/1.json
  def show
    @otaku = Otaku.find(params[:id])

    render json: @otaku
  end

  # POST /otakus
  # POST /otakus.json
  def create
    @otaku = Pusher.create_otaku(params[:otaku])

    if @otaku.valid?
      render json: @otaku, status: :created, location: @otaku
    else
      render json: @otaku.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /otakus/1
  # PATCH/PUT /otakus/1.json
  def update
    @otaku = Pusher.update_otaku(params)

    if @otaku.valid?
      head :no_content
    else
      render json: @otaku.errors, status: :unprocessable_entity
    end
  end

  # DELETE /otakus/1
  # DELETE /otakus/1.json
  def destroy
    @otaku = Pusher.destroy_otaku(params)

    head :no_content
  end
end
