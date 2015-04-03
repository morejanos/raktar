require 'test_helper'

class ComponenttypesControllerTest < ActionController::TestCase
  setup do
    @componenttype = componenttypes(:kondi)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:componenttypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create componenttype" do
    assert_difference('Componenttype.count') do
      post :create, componenttype: { name: @componenttype.name }
    end

    assert_redirected_to componenttype_path(assigns(:componenttype))
  end

  test "should show componenttype" do
    get :show, id: @componenttype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @componenttype
    assert_response :success
  end

  test "should update componenttype" do
    patch :update, id: @componenttype, componenttype: { name: @componenttype.name }
    assert_redirected_to componenttype_path(assigns(:componenttype))
  end

  test "should destroy componenttype" do
    assert_difference('Componenttype.count', -1) do
      delete :destroy, id: @componenttype
    end

    assert_redirected_to componenttypes_path
  end
end
