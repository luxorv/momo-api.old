class AnimesController < ApplicationController
  # GET /animes
  # GET /animes.json
  def index
    @animes = Anime.all

    render json: @animes
  end

  # GET /animes/1
  # GET /animes/1.json
  def show
    @anime = Finder.anime_by_name params[:search]

    binding.pry

    render json: @anime
  end

  # POST /animes
  # POST /animes.json
  def create
    @anime = Anime.new(params[:anime])

    if @anime.save
      render json: @anime, status: :created, location: @anime
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animes/1
  # PATCH/PUT /animes/1.json
  def update
    @anime = Anime.find(params[:id])

    if @anime.update_attributes(params[:anime])
      head :no_content
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animes/1
  # DELETE /animes/1.json
  def destroy
    @anime = Anime.find(params[:id])
    @anime.destroy

    head :no_content
  end
end
