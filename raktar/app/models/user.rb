class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    belongs_to :permission

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :permission_id, presence: true

    def to_s
      name
    end
end
