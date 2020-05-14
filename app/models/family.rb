class Family < ApplicationRecord
    has_many :inclusions
    has_many :users, through: :inclusions
    has_many :recipes, through: :users
end
