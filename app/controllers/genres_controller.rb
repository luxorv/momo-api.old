class GenresController < ApplicationController

  acts_as_token_authentication_handler_for Otaku #, :except => [:index,:show]

  # GET /genres
  # GET /genres.json
  def index
    @genres = Genre.all

    render json: @genres
  end

  # GET /genres/1
  # GET /genres/1.json
  def show
    @genre = KiWi.show_genre params[:id]

    render json: @genre
  end

  # POST /genres
  # POST /genres.json
  def create
    @genre = Pusher.create_genre(params[:genre])

    if @genre.valid?
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  # PATCH/PUT /genres/1.json
  def update
    @genre = Pusher.update_genre(params)

    if @genre.valid?
      head :no_content
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  # DELETE /genres/1.json
  def destroy
    @genre = Pusher.destroy_genre(params)

    head :no_content
  end
end
