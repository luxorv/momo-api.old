require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  setup do
    @genre = genres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genres)
  end

  test "should create genre" do
    assert_difference('Genre.count') do
      post :create, genre: {  }
    end

    assert_response 201
  end

  test "should show genre" do
    get :show, id: @genre
    assert_response :success
  end

  test "should update genre" do
    put :update, id: @genre, genre: {  }
    assert_response 204
  end

  test "should destroy genre" do
    assert_difference('Genre.count', -1) do
      delete :destroy, id: @genre
    end

    assert_response 204
  end
end
