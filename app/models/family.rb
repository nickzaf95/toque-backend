class Family < ApplicationRecord
    has_many :inclusions
    has_many :users, through: :inclusions
    has_many :recipes, through: :users

    validates :name, presence: true, uniqueness: true
    validates :code, presence: true
end
