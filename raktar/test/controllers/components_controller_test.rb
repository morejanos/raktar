require 'test_helper'

class ComponentsControllerTest < ActionController::TestCase

    setup do
        @component = components(:one)    
    end

    test "should get index" do
        get :index

        assert_response :success
        assert_not_nil assigns(:components)
    end
end
