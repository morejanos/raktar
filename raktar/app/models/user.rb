class User < ActiveRecord::Base
    belongs_to :permission

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :permission_id, presence: true

end
