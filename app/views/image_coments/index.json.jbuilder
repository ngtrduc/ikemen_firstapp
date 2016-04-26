json.array!(@image_coments) do |image_coment|
  json.extract! image_coment, :id, :user_id, :image_id, :comment
  json.url image_coment_url(image_coment, format: :json)
end
