json.data do
  json.partial! 'workout', collection: @workouts, as: :workout
end
