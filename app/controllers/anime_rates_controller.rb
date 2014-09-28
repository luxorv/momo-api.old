class AnimeRatesController < ApplicationController
  # GET /anime_rates
  # GET /anime_rates.json
  def index
    @anime_rates = AnimeRate.all

    render json: @anime_rates
  end

  # GET /anime_rates/1
  # GET /anime_rates/1.json
  def show
    @anime_rate = AnimeRate.find(params[:id])

    render json: @anime_rate
  end

  # POST /anime_rates
  # POST /anime_rates.json
  def create
    @anime_rate = AnimeRate.new(params[:anime_rate])

    if @anime_rate.save
      render json: @anime_rate, status: :created, location: @anime_rate
    else
      render json: @anime_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /anime_rates/1
  # PATCH/PUT /anime_rates/1.json
  def update
    @anime_rate = AnimeRate.find(params[:id])

    if @anime_rate.update_attributes(params[:anime_rate])
      head :no_content
    else
      render json: @anime_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /anime_rates/1
  # DELETE /anime_rates/1.json
  def destroy
    @anime_rate = AnimeRate.find(params[:id])
    @anime_rate.destroy

    head :no_content
  end
end
