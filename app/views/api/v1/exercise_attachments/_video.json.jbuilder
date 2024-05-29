json.video do
  json.id video&.id&.split('.')&.first
  json.url video&.url
end
