require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
    test "should not save without a name field" do
        per = Permission.new
        assert_not per.save
    end
end
