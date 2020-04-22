class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admin,   -> { where(admin: true)}

  def is_admin?
    return (self.admin? ? true : false)
  end
end
