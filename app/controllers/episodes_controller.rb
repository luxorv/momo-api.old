class EpisodesController < ApplicationController
  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all

    render json: @episodes
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = KiWi.show_episode params[:id]

    render json: @episode
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(params[:episode])

    if @episode.save
      render json: @episode, status: :created, location: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    if @episode.update_attributes(params[:episode])
      head :no_content
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @episode.destroy

    head :no_content
  end
end
