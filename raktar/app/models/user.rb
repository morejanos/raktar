class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :assign_permission

  belongs_to :permission

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def to_s
    name
  end

  def assign_permission
    self.permission = Permission.find_by name: "worker" if self.permission.nil?
  end

  def admin?
    self.permission.name == "administrator"
  end

  def worker?
    self.permission.name == "worker"
  end

  def poweruser?
    self.permission.name == "poweruser"
  end

end
