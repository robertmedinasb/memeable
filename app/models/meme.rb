class Meme < ApplicationRecord
  belongs_to :category
  belongs_to :user
end
