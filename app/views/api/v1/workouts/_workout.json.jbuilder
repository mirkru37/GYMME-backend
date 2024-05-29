json.id workout.id
json.duration workout.formated_duration
json.exercise_sets do
  json.partial! 'api/v1/exercise_sets/exercise_set', collection: workout.exercise_sets, as: :exercise_set
end
