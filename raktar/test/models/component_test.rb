require 'test_helper'

class ComponentTest < ActiveSupport::TestCase

  test "there should not save with missing parameters" do
    comp = Component.new
    assert_not comp.save
  end

  test "there should not save without an inventory" do
    comp = components(:ell1)
    assert comp.valid?, "Test Component should be valid"

    comp.inventory = nil
    assert_not comp.save
  end

  test "there should not save without a user" do
    comp = components(:ell1)
    comp.user = nil
    assert_not comp.save
  end

  test "there should not save without a name" do
    comp = components(:ell1)
    comp.name = nil
    assert_not comp.save
  end

end
