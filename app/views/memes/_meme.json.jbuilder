json.extract! meme, :id, :title, :meme_type, :url_source, :votes_count, :comments_count, :category_id, :owner_id, :created_at, :updated_at
json.url meme_url(meme, format: :json)
