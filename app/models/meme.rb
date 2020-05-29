class Meme < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :tags
  belongs_to :owner, counter_cache: true, class_name: 'User'
  has_many :comments
  has_many :votes
  has_many :users, through: :comments
  has_many :users, through: :votes
end
