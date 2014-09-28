require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OtakusController, :type => :controller do

  let(:auth_params) {
    auth_params = {}

    otaku = Otaku.last
    otaku.authentication_token ||= Devise.friendly_token
    auth_params[:otaku_email] = otaku.email
    auth_params[:otaku_token] = otaku.authentication_token

    auth_params
  }

  # This should return the minimal set of attributes required to create a valid
  # Otaku. As you add validations to Otaku, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attrs = attributes_for :otaku
    attrs[:name] = "Name Test #{Time.now.to_f}"
    attrs[:email] = "#{Time.now.to_f}@momo.com"
    attrs
  }

  let(:invalid_attributes) {
    attrs = attributes_for :person
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OtakusController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all otakus as @otakus' do
      otaku = Otaku.all.to_json
      get :index, {}, valid_session
      expect(assigns(:otakus).to_json).to eq(otaku)
    end
  end

  describe 'GET show' do
    it 'assigns the requested otaku as @otaku' do
      otaku = Otaku.create! valid_attributes
      get :show, {:id => otaku.to_param}, valid_session
      expect(assigns(:otaku).first).to eq(otaku)
    end
  end

  describe 'POST create' do
    it 'should create a new otaku with Pusher' do

      params = {:otaku => valid_attributes}
      params = params.merge auth_params

      post :create, params, valid_session

      otaku = assigns(:otaku)

      # binding.pry

      expect(otaku).to be_an(Otaku)
      expect(otaku.name).to be_a(String)

      expect(otaku.errors.size).to  eq(0)
    end

    it 'should fail creating a new otaku with Pusher' do

      params = {:not_otaku => valid_attributes}
      params = params.merge auth_params

      post :create, params, valid_session

      otaku = assigns(:otaku)

      expect(otaku.errors.size).to_not  eq(0)
      puts otaku.errors
    end
  end

  describe 'POST lists' do

    it 'should add anime to watch list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      post :add_to_watch_list, params, valid_session

      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watch_list.last).to eql(anime)
    end

    it 'should add anime to watching list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      post :add_to_watching_list, params, valid_session
      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watching_list.last).to eql(anime)
    end

    it 'should add anime to watched list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      post :add_to_watched_list, params, valid_session

      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watched_list.last).to eql(anime)
    end

  end

  describe 'DELETE lists' do

    it 'should remove anime from watch list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      delete :remove_from_watch_list, params, valid_session

      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watch_list.last).to_not eql(anime)
    end

    it 'should remove anime from watching list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      delete :remove_from_watching_list, params, valid_session
      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watching_list.last).to_not eql(anime)
    end

    it 'should remove anime from watched list' do
      anime = Anime.first
      params = {:id => Otaku.first.id, :anime_id => anime.id}
      params = params.merge auth_params

      delete :remove_from_watched_list, params, valid_session

      otaku = assigns(:otaku)

      expect(otaku).to be_an(Otaku)
      expect(otaku.watched_list.last).to_not eql(anime)
    end

  end

  describe 'PUT update' do
    it 'should update an otaku with Pusher' do

      id = Otaku.first.id;
      attrs = valid_attributes
      attrs[:name] =  "Name #{Time.now.to_s}"
      params = {:id => id, :otaku => attrs}
      params = params.merge auth_params

      # binding.pry
      put :update, params, valid_session

      otaku = assigns(:otaku)

      # binding.pry

      expect(otaku).to be_an(Otaku)
      expect(otaku.name).to eq(valid_attributes[:name])

      expect(otaku.errors.size).to  eq(0)
    end

    it 'should fail updating an otaku with Pusher' do

      id = Otaku.first.id;
      attrs = valid_attributes
      attrs[:name] = nil

      params = {:id => id, :otaku => attrs}
      params = params.merge auth_params

      put :update, params, valid_session


      otaku = assigns(:otaku)

      # binding.pry
      expect(otaku.errors.size).not_to  eq(0)
    end
  end

  describe 'DELETE destroy' do
    it 'should delete an otaku with Pusher' do

      otaku = Otaku.first
      params = {:id => otaku.id}
      params = params.merge auth_params

      delete :destroy, params, valid_session

      expect(otaku).not_to eq(Otaku.first)
    end

  end



end
