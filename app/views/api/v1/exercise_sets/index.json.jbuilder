json.data do
  json.partial! 'exercise_set', collection: @exercise_sets, as: :exercise_set
end
