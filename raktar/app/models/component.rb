class Component < ActiveRecord::Base
    belongs_to :type
    belongs_to :packaging
    belongs_to :manufacturer
    belongs_to :user

    validates :name, presence: true
    validates :user_id, presence: true
    validates :inventory, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
   
    scope :stock, -> { where("inventory > 0") }

end
