class Recipe < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :method, presence: true
end
