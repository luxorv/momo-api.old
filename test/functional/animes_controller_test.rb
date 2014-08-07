require 'test_helper'

class AnimesControllerTest < ActionController::TestCase
  setup do
    @anime = animes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:animes)
  end

  test "should create anime" do
    assert_difference('Anime.count') do
      post :create, anime: { director: @anime.director, end_run_date: @anime.end_run_date, english_network: @anime.english_network, episodes: @anime.episodes, manga: @anime.manga, network: @anime.network, start_run_date: @anime.start_run_date, studio: @anime.studio }
    end

    assert_response 201
  end

  test "should show anime" do
    get :show, id: @anime
    assert_response :success
  end

  test "should update anime" do
    put :update, id: @anime, anime: { director: @anime.director, end_run_date: @anime.end_run_date, english_network: @anime.english_network, episodes: @anime.episodes, manga: @anime.manga, network: @anime.network, start_run_date: @anime.start_run_date, studio: @anime.studio }
    assert_response 204
  end

  test "should destroy anime" do
    assert_difference('Anime.count', -1) do
      delete :destroy, id: @anime
    end

    assert_response 204
  end
end
