require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episodes)
  end

  test "should create episode" do
    assert_difference('Episode.count') do
      post :create, episode: { length: @episode.length, popularity: @episode.popularity, release_date: @episode.release_date, season: @episode.season, synopsis: @episode.synopsis, urls: @episode.urls }
    end

    assert_response 201
  end

  test "should show episode" do
    get :show, id: @episode
    assert_response :success
  end

  test "should update episode" do
    put :update, id: @episode, episode: { length: @episode.length, popularity: @episode.popularity, release_date: @episode.release_date, season: @episode.season, synopsis: @episode.synopsis, urls: @episode.urls }
    assert_response 204
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete :destroy, id: @episode
    end

    assert_response 204
  end
end
