require 'test_helper'

class ComponenttypesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @componenttype = componenttypes(:kondi)
  end

  test "should get index" do
    sign_in users(:jani)
    get :index
    assert_response :success
    assert_not_nil assigns(:componenttypes)
  end

  test "should get new" do
    sign_in users(:jani)
    get :new
    assert_response :success
  end

  test "should create componenttype" do
    sign_in users(:jani)
    assert_difference('Componenttype.count') do
      post :create, componenttype: { name: @componenttype.name }
    end

    assert_redirected_to componenttypes_path
  end

  test "should show componenttype" do
    sign_in users(:jani)
    get :show, id: @componenttype
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:jani)
    get :edit, id: @componenttype
    assert_response :success
  end

  test "should update componenttype" do
    sign_in users(:jani)
    patch :update, id: @componenttype, componenttype: { name: @componenttype.name }
    assert_redirected_to componenttypes_path
  end

  test "should destroy componenttype" do
    sign_in users(:jani)
    assert_difference('Componenttype.count', -1) do
      delete :destroy, id: @componenttype
    end

    assert_redirected_to componenttypes_path
  end
end
