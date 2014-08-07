require 'test_helper'

class MangasControllerTest < ActionController::TestCase
  setup do
    @manga = mangas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mangas)
  end

  test "should create manga" do
    assert_difference('Manga.count') do
      post :create, manga: { end_run_date: @manga.end_run_date, english_publisher: @manga.english_publisher, magazine: @manga.magazine, publisher: @manga.publisher, start_run_date: @manga.start_run_date, volumes: @manga.volumes, writer: @manga.writer }
    end

    assert_response 201
  end

  test "should show manga" do
    get :show, id: @manga
    assert_response :success
  end

  test "should update manga" do
    put :update, id: @manga, manga: { end_run_date: @manga.end_run_date, english_publisher: @manga.english_publisher, magazine: @manga.magazine, publisher: @manga.publisher, start_run_date: @manga.start_run_date, volumes: @manga.volumes, writer: @manga.writer }
    assert_response 204
  end

  test "should destroy manga" do
    assert_difference('Manga.count', -1) do
      delete :destroy, id: @manga
    end

    assert_response 204
  end
end
