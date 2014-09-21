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
    @episode = Finder.find_episode_by_id params[:id]
    @episode ||= KiWi.show_episode params[:id]

    render json: @episode
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Pusher.create_episode(params[:episode])

    if @episode.valid?
      render json: @episode, status: :created, location: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    @episode = Pusher.update_episode(params)

    if @episode.valid?
      head :no_content
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Pusher.destroy_episode(params)

    head :no_content
  end
end
