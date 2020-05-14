class User < ApplicationRecord
    has_many :inclusions
    has_many :families, through: :inclusions
    has_many :recipes
end
