require 'test_helper'

class PackagingTest < ActiveSupport::TestCase
    test "Name field should not save without name field" do
        pac = Packaging.new
        assert_not pac.save
    end
end
