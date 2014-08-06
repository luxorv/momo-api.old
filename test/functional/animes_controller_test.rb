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
      post :create, anime: { category: @anime.category, name: @anime.name, released: @anime.released }
    end

    assert_response 201
  end

  test "should show anime" do
    get :show, id: @anime
    assert_response :success
  end

  test "should update anime" do
    put :update, id: @anime, anime: { category: @anime.category, name: @anime.name, released: @anime.released }
    assert_response 204
  end

  test "should destroy anime" do
    assert_difference('Anime.count', -1) do
      delete :destroy, id: @anime
    end

    assert_response 204
  end
end
