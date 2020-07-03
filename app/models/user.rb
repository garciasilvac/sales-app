class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    after_initialize :set_defaults, unless: :persisted?
    private
        def set_defaults
            self.deleted = false if self.deleted.nil?
        end
end
