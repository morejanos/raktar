require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @manufacturer = manufacturers(:elso)
  end
  
  test "Manufacturer should not save without name" do
      sign_in users(:jani)
      man = Manufacturer.new
      assert_not man.save
   end

   test "should get index" do
      sign_in users(:jani)
      get :index
      assert_response :success
      assert_not_nil assigns(:manufacturers)
   end

   test "should get new" do
      sign_in users(:jani)
      get :new
      assert_response :success
      assert_not_nil assigns(:manufacturer)
   end

   test "should create manufacturer" do
    sign_in users(:jani)
    assert_difference('Manufacturer.count') do
      post :create, manufacturer: { name: @manufacturer.name, email: "aaa@aaa.a" }
    end

    assert_redirected_to manufacturers_path
  end

  test "should show manufacturer" do
    sign_in users(:jani)
    get :show, id: @manufacturer
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:jani)
    get :edit, id: @manufacturer
    assert_response :success
  end

  test "should update manufacturer" do
    sign_in users(:jani)
    patch :update, id: @manufacturer, manufacturer: { name: @manufacturer.name }
    assert_redirected_to manufacturers_path
  end

  test "should destroy manufacturer" do
    sign_in users(:jani)
    assert_difference('Manufacturer.count', -1) do
      delete :destroy, id: @manufacturer
    end

    assert_redirected_to manufacturers_path
  end
end
