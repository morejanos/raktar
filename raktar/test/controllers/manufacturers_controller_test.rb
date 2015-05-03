require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  
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
end
