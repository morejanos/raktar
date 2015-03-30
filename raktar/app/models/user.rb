class User < ActiveRecord::Base
    belongs_to :permission

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :permission_id, presence: true

end
