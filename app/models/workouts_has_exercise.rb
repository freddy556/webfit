class Workouts_has_exercise < ActiveRecord::Base
  belongs_to :workouts
  belongs_to :exercises
end
