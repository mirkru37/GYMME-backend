json.data do
  json.partial! 'video', video: @exercise.video
  json.attachments do
    json.partial! 'image', collection: @exercise.exercise_attachments, as: :attachment
  end
end
