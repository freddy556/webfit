class Workout < ActiveRecord::Base
  has_many :workout_has_exercises
end
