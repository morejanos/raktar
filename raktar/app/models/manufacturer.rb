class Manufacturer < ActiveRecord::Base
    has_many :components
    validates :name, presence: true
    validates :email, format: {with: /@/, message: "Invalid Email cím lett megadva."}
end
