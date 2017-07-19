require 'test_helper'

class StatusTest < ActiveSupport::TestCase

  test "name should must fill in" do
    type = statuses(:rendIgeny)
    assert type.valid? "Status should be valid"

    type = statuses(:rendelve)
    assert type.valid? "Status should be valid"

    type = statuses(:nincsRendIgeny)
    assert type.valid? "Status should be valid"

    type.name = nil
    assert_not type.save
  end
end
