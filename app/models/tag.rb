class Tag < ApplicationRecord
  has_and_belongs_to_many :memes
  validates :name, presence: true, uniqueness: true, allow_blank: false
end
