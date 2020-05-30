class Meme < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :tags
  belongs_to :owner, counter_cache: true, class_name: 'User'
  has_many :comments
  has_many :votes
  has_many :users, through: :comments
  has_many :users, through: :votes

  validate :check_valid_url

  private

  def check_valid_url
    matches = url_source.match(/http(?:|s):.*\.(?<ext>jpg|png|jpeg|gif)/)

    if matches.nil?
      errors.add(:url_source, 'is not valid')
    else
      case matches[:ext]
      when 'gif'
        errors.add(:url_source, 'extension does not match meme type') unless meme_type == 'gif'
      else
        errors.add(:url_source, 'extension does not match meme type') if meme_type == 'gif'
      end
    end
  end

end
