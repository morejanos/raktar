require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

    setup do
        @component = components(:ell1) 
    end

    test "should get index with poweruser" do
      sign_in users(:jani)
      get :index

      assert_response :success
      assert_not_nil assigns(:components)
    end

    test "should get index with worker" do
      sign_in users(:peti)
      get :index

      assert_response :success
      assert_not_nil assigns(:components)
    end

    test "should not delete with worker" do
      sign_in users(:peti)
      assert_not_respond_to @component, :new
    end

    test "should get update with worker" do
      sign_in users(:peti)
      assert_respond_to @component, :update
    end

end
