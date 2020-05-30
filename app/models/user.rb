class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments
  has_many :memes, through: :comments
  has_many :votes
  has_many :memes, through: :votes
  has_many :memes, foreign_key: 'owner_id'

  validates :username, presence: true, uniqueness: true, allow_blank: false
  validates :email, presence: true, uniqueness: true, allow_blank: false
end