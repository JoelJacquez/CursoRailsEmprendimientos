require 'test_helper'

class EntrepreneursControllerTest < ActionController::TestCase
  setup do
    @entrepreneur = entrepreneurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entrepreneurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entrepreneur" do
    assert_difference('Entrepreneur.count') do
      post :create, entrepreneur: { description: @entrepreneur.description, title: @entrepreneur.title }
    end

    assert_redirected_to entrepreneur_path(assigns(:entrepreneur))
  end

  test "should show entrepreneur" do
    get :show, id: @entrepreneur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entrepreneur
    assert_response :success
  end

  test "should update entrepreneur" do
    patch :update, id: @entrepreneur, entrepreneur: { description: @entrepreneur.description, title: @entrepreneur.title }
    assert_redirected_to entrepreneur_path(assigns(:entrepreneur))
  end

  test "should destroy entrepreneur" do
    assert_difference('Entrepreneur.count', -1) do
      delete :destroy, id: @entrepreneur
    end

    assert_redirected_to entrepreneurs_path
  end
end
