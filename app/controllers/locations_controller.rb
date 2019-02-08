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
    @game = @location.level.game
  end

  # POST /locations
  # POST /locations.json
  def create
    @game = Level.find(location_params[:level_id]).game
    maintainers_ids = @game.maintainers.ids

    if maintainers_ids.include?(current_operator.id)
      @location = Location.new(location_params)
      @location.save
    end

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @game = @location.level.game
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      if @location.update(location_params)
        flash[:notice] = "Location was successfully updated."
      else 
        flash[:notice] = "Location was successfully updated."
      end
    end 
    redirect_to game_path(@game)
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
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
      params.require(:location).permit(:name, :level_id)
    end
end
