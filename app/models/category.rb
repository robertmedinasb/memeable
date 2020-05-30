class Category < ApplicationRecord
  has_many :memes
  validates :name, presence: true, uniqueness: true, allow_blank: false
end
