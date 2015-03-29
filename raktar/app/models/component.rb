class Component < ActiveRecord::Base
    belongs_to :type
    belongs_to :packaging
    belongs_to :manufacturer
    belongs_to :user

end
