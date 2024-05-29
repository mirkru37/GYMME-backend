# frozen_string_literal: true

puts 'Seeding database...'
puts 'Creating muscles...'
['triceps', 'biceps', 'deltoids', 'quadriceps', 'hamstrings', 'calves', 'chest', 'back', 'abs', 'obliques', 'forearms'].each do |muscle|
  Muscle.create(name: muscle)
end
puts 'Muscles created!'
puts 'Creating exercises...'
[
  {name: 'pushups', primary_muscle: 'triceps', secondary_muscles: ['chest', 'deltoids']},
  {name: 'pullups', primary_muscle: 'biceps', secondary_muscles: ['back']},
  {name: 'squats', primary_muscle: 'quadriceps', secondary_muscles: ['hamstrings', 'calves']},
  {name: 'crunches', primary_muscle: 'abs', secondary_muscles: ['obliques']},
  {name: 'lunges', primary_muscle: 'quadriceps', secondary_muscles: ['hamstrings', 'calves']},
  {name: 'bench press', primary_muscle: 'chest', secondary_muscles: ['triceps', 'deltoids']},
  {name: 'deadlifts', primary_muscle: 'back', secondary_muscles: ['hamstrings', 'quadriceps']},
  {name: 'planks', primary_muscle: 'abs', secondary_muscles: ['obliques']},
  {name: 'shoulder press', primary_muscle: 'deltoids', secondary_muscles: ['triceps']},
  {name: 'bicep curls', primary_muscle: 'biceps', secondary_muscles: ['forearms']}
].each do |exercise|
  e = Exercise.new(name: exercise[:name], primary_muscle: Muscle.find_by(name: exercise[:primary_muscle]))
  exercise[:secondary_muscles].each do |muscle|
    e.secondary_muscles << Muscle.find_by(name: muscle)
  end
  e.save!
end

puts 'Done..'
