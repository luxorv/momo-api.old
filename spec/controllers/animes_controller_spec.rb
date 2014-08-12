require 'rails_helper'

RSpec.describe AnimesController, :type => :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all animes as @animes" do
      anime = Anime.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:animes)).to eq([anime])
    end
  end

  describe "GET show" do
    it "assigns the requested anime as @anime" do
      anime = Anime.create! valid_attributes
      get :show, {:id => anime.to_param}, valid_session
      expect(assigns(:anime)).to eq(anime)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Anime" do
        expect {
          post :create, {:anime => valid_attributes}, valid_session
        }.to change(Anime, :count).by(1)
      end

      it "assigns a newly created anime as @anime" do
        post :create, {:anime => valid_attributes}, valid_session
        expect(assigns(:anime)).to be_a(Anime)
        expect(assigns(:anime)).to be_persisted
      end

      it "redirects to the created anime" do
        post :create, {:anime => valid_attributes}, valid_session
        expect(response).to redirect_to(Anime.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved anime as @anime" do
        post :create, {:anime => invalid_attributes}, valid_session
        expect(assigns(:anime)).to be_a_new(Anime)
      end

      it "re-renders the 'new' template" do
        post :create, {:anime => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested anime" do
        anime = Anime.create! valid_attributes
        put :update, {:id => anime.to_param, :anime => new_attributes}, valid_session
        anime.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested anime as @anime" do
        anime = Anime.create! valid_attributes
        put :update, {:id => anime.to_param, :anime => valid_attributes}, valid_session
        expect(assigns(:anime)).to eq(anime)
      end

      it "redirects to the anime" do
        anime = Anime.create! valid_attributes
        put :update, {:id => anime.to_param, :anime => valid_attributes}, valid_session
        expect(response).to redirect_to(anime)
      end
    end

    describe "with invalid params" do
      it "assigns the anime as @anime" do
        anime = Anime.create! valid_attributes
        put :update, {:id => anime.to_param, :anime => invalid_attributes}, valid_session
        expect(assigns(:anime)).to eq(anime)
      end

      it "re-renders the 'edit' template" do
        anime = Anime.create! valid_attributes
        put :update, {:id => anime.to_param, :anime => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested anime" do
      anime = Anime.create! valid_attributes
      expect {
        delete :destroy, {:id => anime.to_param}, valid_session
      }.to change(Anime, :count).by(-1)
    end

    it "redirects to the animes list" do
      anime = Anime.create! valid_attributes
      delete :destroy, {:id => anime.to_param}, valid_session
      expect(response).to redirect_to(animes_url)
    end
  end

end
