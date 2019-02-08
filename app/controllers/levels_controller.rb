class LevelsController < ApplicationController
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  # GET /levels
  # GET /levels.json
  def index
    @levels = Level.all
  end

  # GET /levels/1
  # GET /levels/1.json
  def show; end

  # GET /levels/new
  def new
    @level = Level.new
  end

  # GET /levels/1/edit
  def edit
    @game = Game.find params[:game_id]
  end

  # POST /levels
  # POST /levels.json
  def create
    @game = Game.find level_params[:game_id]
    maintainers = @game.maintainers.ids
    if maintainers.include?(current_operator.id)
      @level = Level.new(level_params)
      if @level.save
        flash[:notice] = "Level was successfully created."
      else
        flash[:alter] = "Level was not created."
      end
    end
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /levels/1
  # PATCH/PUT /levels/1.json
  def update
    @game = Game.find level_params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      if @level.update(level_params)
        flash[:notice] = "Level was successfully created."
      else 
        flash[:notice] = "Level was successfully created."
      end
    end 
    redirect_to game_path(@game)
  end

  # DELETE /levels/1
  # DELETE /levels/1.json
  def destroy
    if @level.destroy
      flash[:notice] = "Level was successfully destroyed."
    else
      flash[:alter] = "Level was not destroyed."
    end
    redirect_back fallback_location: root_path
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_level
      @level = Level.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def level_params
      params.fetch(:level, {}).permit(:name, :game_id)
    end
end
