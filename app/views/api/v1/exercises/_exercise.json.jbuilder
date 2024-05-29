json.id exercise.id
json.name exercise.name
json.instructions exercise.instructions
json.is_public exercise.is_public
json.primary_muscle do
  json.partial! partial: 'api/v1/muscles/muscle', locals: { muscle: exercise.primary_muscle }
end
json.secondary_muscles do
  json.partial! 'api/v1/muscles/muscle', collection: exercise.secondary_muscles, as: :muscle
end
