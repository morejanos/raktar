require 'test_helper'

class ComponenttypeTest < ActiveSupport::TestCase

  test "name should must fill in" do
    type = componenttypes(:kondi)
    assert type.valid?
      
    type.name = nil
    assert_not type.save
  end
end
