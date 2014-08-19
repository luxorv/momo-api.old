class AnimesController < ApplicationController
  # GET /animes
  # GET /animes.json
  def index
    @animes = Anime.all
    # @animes = Finder.find_anime_by_name params[:name]

    render json: @animes
  end

  # GET /animes/1
  # GET /animes/1.json
  def show

    @anime = Finder.find_anime_by_id params[:id]
    @anime ||= KiWi.show_anime params[:id]

    # binding.pry

    render json: @anime
  end

  def search
    method = build_finder_method

 #   binding.pry
    @animes = eval "Finder.#{method[:name]}(#{method[:args]})"

    render json: @animes
  end

  # POST /animes
  # POST /animes.json
  def create
    @anime = Pusher.create_anime(params[:anime])

    if @anime
      render json: @anime, status: :created, location: @anime
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /animes/1
  # PATCH/PUT /animes/1.json
  def update
    # @anime = Finder.find_anime_by_id params[:id]
    @anime = Pusher.update_anime(params)

    if @anime
      head :no_content
    else
      render json: @anime.errors, status: :unprocessable_entity
    end
  end

  # DELETE /animes/1
  # DELETE /animes/1.json
  def destroy
    @anime = Pusher.destroy_anime(params)

    head :no_content
  end

  private

    def filter_search_params
      search_params = {}

      params.each do |key, value|
        search_params[key] = value if key != "action" and key != "controller"
      end

      search_params
    end

    def build_finder_method

      new_params = filter_search_params
      method_name = "find_anime_by_"
      args = []
      index = 0

      new_params.each do |key, value|
        index += 1
        method_name += "#{key}"
        args << value
        method_name += "_and_" if index < new_params.size
      end

      {name: method_name, args: args}
    end
end
