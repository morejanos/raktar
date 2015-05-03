require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase

    test "should not save without name" do
      man = Manufacturer.new
      assert_not man.save
    end

    test "should not allow invalid email address" do
      man = Manufacturer.new
      man.name = "Valaki"
      assert_not man.valid?
      man.email = "12345.hu"
      assert_not man.valid?

      man.email = "pipi@1234.hu"
      assert man.valid?
    end
end
