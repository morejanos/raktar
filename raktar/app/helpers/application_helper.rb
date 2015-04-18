module ApplicationHelper

    def user_logged_in_msg
        str = ''
        str += '<div class="userloggedin">'
        if user_signed_in?
            str += "<p id=""user_info"">#{current_user}<br>#{link_to('Logout', destroy_user_session_path, :method => :delete)}</p>"
        else
            str += "<p id=""user_info"">#{link_to('Login', new_user_session_path)} | #{link_to('Register', new_user_registration_path)}</p>"
        end
        str += '</div>'
        raw(str)
    end

end
