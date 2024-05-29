json.data do
  json.partial! 'exercise', collection: @exercises, as: :exercise
end
json.meta do
  json.total @meta[:total]
end
