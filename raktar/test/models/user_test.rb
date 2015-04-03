require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "should not save without name field" do
        user = User.new
        assert_not user.save
    end

    test "should not save without a permission" do
        user = users(:peti)
        assert user.valid?

        user.permission = nil
        assert_not user.save
    end

end
