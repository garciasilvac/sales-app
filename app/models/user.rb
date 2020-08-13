class User < ApplicationRecord
    has_many :user_roles, dependent: :destroy
    has_many :roles, through: :user_roles
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    after_initialize :set_defaults, unless: :persisted?

    def has_role(role)
      if not (Role.exists?(name: role))
        return false
      elsif self.roles.empty?
        return false
      else
        self.roles.each do |r|
          return true if r.name == role
        end
        return false
      end
    end
  
    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
        end
end
