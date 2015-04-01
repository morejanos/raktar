class Manufacturer < ActiveRecord::Base
    has_many :components
    validates :name, presence: true
end
