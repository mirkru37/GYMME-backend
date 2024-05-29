json.image do
  json.id attachment&.id
  json.url attachment&.attachment&.url
end
