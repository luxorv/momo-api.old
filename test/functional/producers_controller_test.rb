require 'test_helper'

class ProducersControllerTest < ActionController::TestCase
  setup do
    @producer = producers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producers)
  end

  test "should create producer" do
    assert_difference('Producer.count') do
      post :create, producer: { type: @producer.type, website: @producer.website }
    end

    assert_response 201
  end

  test "should show producer" do
    get :show, id: @producer
    assert_response :success
  end

  test "should update producer" do
    put :update, id: @producer, producer: { type: @producer.type, website: @producer.website }
    assert_response 204
  end

  test "should destroy producer" do
    assert_difference('Producer.count', -1) do
      delete :destroy, id: @producer
    end

    assert_response 204
  end
end
