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
  # POST /otakus/:id/add/watch/:anime_id
  def add_to_watch_list
    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = add_to_list @otaku, 'watch_list', anime
  end

  # Adds an anime to an otaku's watched list
  # POST /otakus/:id/add/watched/:anime_id
  def add_to_watched_list

    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = add_to_list @otaku, 'watched_list', anime
  end

  # Adds an anime to an otaku's watching list
  # POST /otakus/:id/add/watching/:anime_id
  def add_to_watching_list

    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = add_to_list @otaku, 'watching_list', anime
  end

  # Adds an anime to an otaku's watch list
  # POST /otakus/:id/add/watch/:anime_id
  def remove_from_watch_list
    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = remove_from_list @otaku, 'watch_list', anime
  end

  # Adds an anime to an otaku's watched list
  # POST /otakus/:id/add/watched/:anime_id
  def remove_from_watched_list

    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = remove_from_list @otaku, 'watched_list', anime
  end

  # Adds an anime to an otaku's watching list
  # POST /otakus/:id/add/watching/:anime_id
  def remove_from_watching_list

    @otaku = Finder.find_otaku_by_id params[:id]
    anime = Anime.get_anime params[:anime_id]

    @otaku = remove_from_list @otaku, 'watching_list', anime
  end

  private
  def add_to_list(otaku, list, anime)
    err = false

    if anime.size > 0 and otaku.size > 0
      otaku = otaku.first
      anime = anime.first

      otaku.send(list.to_sym).push anime

      if otaku.save!
        render json: otaku
      else
        err = true
      end
    else
      err = true;
    end

    head :no_content if err

    return otaku

  end

  def remove_from_list(otaku, list, anime)
    err = false

    if anime.size > 0 and otaku.size > 0
      otaku = otaku.first
      anime = anime.first

      otaku.send(list.to_sym).delete anime

      if otaku.save!
        render json: otaku
      else
        err = true
      end
    else
      err = true;
    end

    head :no_content if err

    return otaku

  end



end
