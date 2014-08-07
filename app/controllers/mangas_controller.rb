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
    @manga = Manga.find(params[:id])

    render json: @manga
  end

  # POST /mangas
  # POST /mangas.json
  def create
    @manga = Manga.new(params[:manga])

    if @manga.save
      render json: @manga, status: :created, location: @manga
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mangas/1
  # PATCH/PUT /mangas/1.json
  def update
    @manga = Manga.find(params[:id])

    if @manga.update_attributes(params[:manga])
      head :no_content
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mangas/1
  # DELETE /mangas/1.json
  def destroy
    @manga = Manga.find(params[:id])
    @manga.destroy

    head :no_content
  end
end
