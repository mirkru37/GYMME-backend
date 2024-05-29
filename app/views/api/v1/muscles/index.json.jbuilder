json.data do
  json.muscles do
    json.partial! 'muscle', collection: @muscles, as: :muscle
  end
end
