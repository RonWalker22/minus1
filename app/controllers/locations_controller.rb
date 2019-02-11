class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
    @game = @location.game
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)
    levels = @location.game.levels.ids
    if @location.save
      params[:location][:level_id].each do |level_id|
        level_id = level_id.to_i
        next if levels.exclude?(level_id)

        LevelLocation.create! level_id: level_id, location_id: @location.id
      end
      add_contributor(@location.game)
      flash[:notice] = "Location was successfully created."
    else
      flash[:alter] = "Location was not created."
    end
    redirect_back fallback_location: games_path
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    authorize @location
    if @location.update(location_params)
      flash[:notice] = "Location was successfully updated."
    else 
      flash[:notice] = "Location was successfully updated."
    end
    redirect_to game_path(@location.game)
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    authorize @location
    if @location.destroy
      flash[:notice] = "Location was successfully destroyed."
    else
      flash[:alert] = "Location was not destroyed."
    end
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params[:location][:operator_id] = current_operator.id
      params.require(:location).permit(:name, :game_id, :operator_id)
    end
end
