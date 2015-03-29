class Manufacturer < ActiveRecord::Base
    has_many :components
end
