require 'test_helper'

class StudiosControllerTest < ActionController::TestCase
  setup do
    @studio = studios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studios)
  end

  test "should create studio" do
    assert_difference('Studio.count') do
      post :create, studio: { founded: @studio.founded, industry: @studio.industry, website: @studio.website }
    end

    assert_response 201
  end

  test "should show studio" do
    get :show, id: @studio
    assert_response :success
  end

  test "should update studio" do
    put :update, id: @studio, studio: { founded: @studio.founded, industry: @studio.industry, website: @studio.website }
    assert_response 204
  end

  test "should destroy studio" do
    assert_difference('Studio.count', -1) do
      delete :destroy, id: @studio
    end

    assert_response 204
  end
end
