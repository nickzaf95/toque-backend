class User < ApplicationRecord
    has_many :inclusions
    has_many :families, through: :inclusions
    has_many :recipes
    has_secure_password

    validates :full_name, presence: true
    validates :email, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true

end
