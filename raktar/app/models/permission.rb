class Permission < ActiveRecord::Base
    has_many :users

    validates :name, presence: true
    
    def to_s
        name
    end

end
