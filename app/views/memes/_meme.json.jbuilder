json.extract! meme, :id, :title, :type, :url_source, :votes_count, :comments_count, :category_id, :user_id, :created_at, :updated_at
json.url meme_url(meme, format: :json)
