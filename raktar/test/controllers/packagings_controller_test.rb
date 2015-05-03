require 'test_helper'

class PackagingsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should get index" do
    sign_in users(:jani)
    get :index
    assert_response :success
    assert_not_nil assigns(:packagings)
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

    assert_redirected_to packaging_path(assigns(:packaging))
  end

end
