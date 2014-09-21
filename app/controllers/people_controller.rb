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
    @person = Finder.find_person_by_id params[:id]
    @person ||= KiWi.show_person params[:id]

    render json: @person
  end

  # POST /people
  # POST /people.json
  def create
    @person = Pusher.create_person(params[:person])

    if @person.valid?
      render json: @person, status: :created, location: @person
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person = Pusher.update_person(params)

    if @person.valid?
      head :no_content
    else
      render json: @person.errors, status: :unprocessable_entity
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Pusher.destroy_person(params)

    head :no_content
  end
end
