class MangasController < ApplicationController
  # GET /mangas
  # GET /mangas.json
  def index
    @mangas = Manga.all

    render json: @mangas
  end

  # GET /mangas/1
  # GET /mangas/1.json
  def show
    @manga =KiWi.show_manga params[:id]

    render json: @manga
  end

  # POST /mangas
  # POST /mangas.json
  def create
    @manga = Pusher.create_manga(params[:manga])

    if @manga.valid?
      render json: @manga, status: :created, location: @manga
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mangas/1
  # PATCH/PUT /mangas/1.json
  def update
    @manga = Pusher.update_manga(params)

    if @manga.valid?
      head :no_content
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mangas/1
  # DELETE /mangas/1.json
  def destroy
    @manga = Pusher.destroy_manga(params)

    head :no_content
  end
end
