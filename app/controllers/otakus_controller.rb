class OtakusController < ApplicationController

  acts_as_token_authentication_handler_for Otaku, :except => [:index,:show]

  before_filter
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
    @otaku = Otaku.new(params[:otaku])

    if @otaku.save
      render json: @otaku, status: :created, location: @otaku
    else
      render json: @otaku.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /otakus/1
  # PATCH/PUT /otakus/1.json
  def update
    @otaku = Otaku.find(params[:id])

    if @otaku.update_attributes(params[:otaku])
      head :no_content
    else
      render json: @otaku.errors, status: :unprocessable_entity
    end
  end

  # DELETE /otakus/1
  # DELETE /otakus/1.json
  def destroy
    @otaku = Otaku.find(params[:id])
    @otaku.destroy

    head :no_content
  end
end
