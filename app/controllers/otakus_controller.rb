class OtakusController < ApplicationController

  acts_as_token_authentication_handler_for Otaku, :except => [:index, :show]

  # GET /otakus
  # GET /otakus.json
  def index
    @otakus = Otaku.all

    render json: @otakus
  end

  # GET /otakus/1
  # GET /otakus/1.json
  def show
    @otaku = Finder.find_otaku_by_id params[:id]
    @otaku ||= KiWi.show_otaku params[:id]

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

  # Adds an anime to an otaku's watch list
  # POST /otakus/add/watch
  def add_to_watch_list

    @otaku = Finder.find_otaku_by_id params[:otaku_id]
    anime = Anime.get_anime params[:anime_id]

    @otaku.watch_list.push anime

    if @otaku.save!
      render json: @otaku
    else
      head :no_content
    end
  end

  # Adds an anime to an otaku's watched list
  # POST /otakus/add/watched
  def add_to_watched_list

    @otaku = Finder.find_otaku_by_id params[:otaku_id]
    anime = Anime.get_anime params[:anime_id]

    @otaku.watched_list.push anime

    if @otaku.save!
      render json: @otaku
    else
      head :no_content
    end
  end

  # Adds an anime to an otaku's watching list
  # POST /otakus/add/watching
  def add_to_watching_list

    @otaku = Finder.find_otaku_by_id params[:otaku_id]
    anime = Anime.get_anime params[:anime_id]

    @otaku.watching_list.push anime

    if @otaku.save!
      render json: @otaku
    else
      head :no_content
    end
  end


end
