class PeopleController < ApplicationController
  # GET /people
  # GET /people.json
  def index
    @people = Person.all

    render json: @people
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = KiWi.show_person params[:id]

    render json: @person
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    if @person.save
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(params[:person])
      head :no_content
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    head :no_content
  end
end
