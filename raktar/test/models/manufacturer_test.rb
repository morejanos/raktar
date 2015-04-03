require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase

    test "manufacturer should not save without name" do
        man = Manufacturer.new
        assert_not man.save, "Manufacturer should not save without name"
        assert true
    end

end
