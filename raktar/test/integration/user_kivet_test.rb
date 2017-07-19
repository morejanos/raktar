require 'test_helper'

class UserKivetTest < ActionDispatch::IntegrationTest
    test "default homepage without user logged in" do
	get "/"
	assert_response :success
    end

    test "redirect back to default homepage without user logged in" do
        get "/components/"
	get_via_redirect(root_path)
	assert_response :success
    end
    
    test "user should ba able to log in" do
	post_via_redirect "/users/sign_in", 'user[email]' => users(:peti).email,'user[password]' =>users(:peti).encrypted_password
	assert_response :success
    end
end
