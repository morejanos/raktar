require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
   test "Manufacturer should not save without name" do
       man = Manufacturer.new
       assert_not man.save
   end

   test "should get index" do
       get :index
       assert_response :success
       assert_not_nil assigns(:manufacturers)
   end

   test "should get new" do
       get :new
       assert_response :success
       assert_not_nil assigns(:manufacturer)
   end
end
