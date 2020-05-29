class Category < ApplicationRecord
  has_many :memes
  validates :name, presence: true, uniqueness: true
end
