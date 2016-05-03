class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  # GET /workouts
  # GET /workouts.json
  def index
    @workouts = Workout.all
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
    @exercises = Exercise.all
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    workout_name = params[:workout][:name]
    workout_days = params[:workout][:days]

    workout = Workout.new(:name => workout_name)
    if workout.save!
      workout_days.each do |day|
        day[1].each do |exercise|
          Workouts_has_exercise.new(
          :workouts_id => workout.id,
          :exercises_id => exercise[1][:exercise_id],
          :day => day[0],
          :num_reps => exercise[1][:num_reps],
          :num_sets => exercise[1][:num_sets]).save!
        end
      end
    end
    # p workout_name
    # p workout_days



    render nothing: true

    # respond_to do |format|
    #   if @workout.save
    #     format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
    #     format.json { render :show, status: :created, location: @workout }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @workout.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:workout)
    end
end
