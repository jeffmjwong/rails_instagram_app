json.extract! instapost, :id, :caption, :user_id, :created_at, :updated_at
json.url instapost_url(instapost, format: :json)
