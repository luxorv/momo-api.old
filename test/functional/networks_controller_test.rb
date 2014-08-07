require 'test_helper'

class NetworksControllerTest < ActionController::TestCase
  setup do
    @network = networks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:networks)
  end

  test "should create network" do
    assert_difference('Network.count') do
      post :create, network: { region: @network.region }
    end

    assert_response 201
  end

  test "should show network" do
    get :show, id: @network
    assert_response :success
  end

  test "should update network" do
    put :update, id: @network, network: { region: @network.region }
    assert_response 204
  end

  test "should destroy network" do
    assert_difference('Network.count', -1) do
      delete :destroy, id: @network
    end

    assert_response 204
  end
end
