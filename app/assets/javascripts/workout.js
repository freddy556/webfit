var workout = {
  name: '',
  days: []
}
var send_workout = function() {
  workout.name = $('#workout_name').val();
  for (var i = 0; i < 7; i++) {
    var day = $('.day-' + i);
    workout.days[i] = [];
    for (var j = 0; j < 3; j++) {
      workout.days[i][j] = {};
      var exercise = day.find('.exe-' + j);
      workout.days[i][j].exercise_id = exercise.find('select[name=exercises]').val();
      workout.days[i][j].num_sets = exercise.find('input[name=num_sets]').val();
      workout.days[i][j].num_reps = exercise.find('input[name=num_reps]').val();
    }
  }

  var url = '/workouts';

  settings = {
    type: 'POST',
    data: {workout: workout}
  }

  $.ajax(url, settings)
}

var ready = function() {
  $('#submit').click(send_workout);
}

$(document).ready(ready);
