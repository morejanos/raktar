require 'test_helper'

class PackagingsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @packaging = packagings(:din)
  end

  test "should get index" do
    sign_in users(:jani)
    get :index
    assert_response :success
    assert_not_nil assigns(:packagings)
  end

  test "should not get index with worker user" do
    sign_in users(:peti)
    get :index
    assert_redirected_to root_path
  end

  test "should get new" do
    sign_in users(:jani)
    get :new
    assert_response :success
  end

  test "should create packaging"  do
    sign_in users(:jani)
    assert_difference('Packaging.count') do
      post :create, packaging: { name: "Új tokozás" }
    end

    assert_redirected_to packagings_path
  end

  test "should show packaging" do
    sign_in users(:jani)
    get :show, id: @packaging
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:jani)
    get :edit, id: @packaging
    assert_response :success
  end

  test "should update packaging" do
    sign_in users(:jani)
    patch :update, id: @packaging, packaging: { name: @packaging.name }
    assert_redirected_to packagings_path
  end

  test "should destroy packaging" do
    sign_in users(:jani)
    assert_difference('Packaging.count', -1) do
      delete :destroy, id: @packaging
    end

    assert_redirected_to packagings_path
  end

end
