require 'test_helper'

class ManufacturersControllerTest < ActionController::TestCase
   test "Manufacturer should not save without name" do
       man = Manufacturer.new
       assert_not man.save
   end
end
