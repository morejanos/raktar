require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "should not get index with worker user" do
    sign_in users(:peti)
    get :index
    assert_redirected_to root_path
  end

end
