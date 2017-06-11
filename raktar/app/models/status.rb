class Status < ActiveRecord::Base
    has_many :components

    validates :name, presence: true 
    
    def to_s
        name
    end
end
