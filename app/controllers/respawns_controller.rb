class RespawnsController < ApplicationController
  before_action :set_respawn, only: [:show, :edit, :update, :destroy]

  # GET /respawns
  # GET /respawns.json
  def index
    @respawns = Respawn.all
  end

  # GET /respawns/1
  # GET /respawns/1.json
  def show
  end

  # GET /respawns/new
  def new
    @respawn = Respawn.new
  end

  # GET /respawns/1/edit
  def edit
    @game = Game.find params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.exclude?(current_operator.id)
      return redirect_back fallback_location: root_path
    end
  end

  # POST /respawns
  # POST /respawns.json
  def create
    @game = Game.find respawn_params[:game_id]
    levels = @game.levels.ids
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      @respawn = Respawn.new(respawn_params)
      if @respawn.save
        params[:respawn][:level_id].each do |level_id|
          level_id = level_id.to_i
          next if levels.exclude?(level_id)

          LevelRespawn.create! level_id: level_id, respawn_id: @respawn.id
        end
        flash[:notice] = "Respawn was successfully created."
      else
        flash[:alter] = "Respawn was not created."
      end
    end
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /respawns/1
  # PATCH/PUT /respawns/1.json
  def update
    @game = Game.find respawn_params[:game_id]
    levels = @game.levels.ids
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      if @respawn.update(respawn_params)
        LevelRespawn.where(respawn_id: @respawn.id).destroy_all
        params[:respawn][:level_id].each do |level_id|
          level_id = level_id.to_i
          next if levels.exclude?(level_id)

          LevelRespawn.create! level_id: level_id, respawn_id: @respawn.id
        end
        flash[:notice] = "Respawn was successfully created."
      else 
        flash[:notice] = "Respawn was successfully created."
      end
    end 
    redirect_to game_path(@game)
  end

  # DELETE /respawns/1
  # DELETE /respawns/1.json
  def destroy
    @respawn.destroy
    respond_to do |format|
      format.html { redirect_to respawns_url, notice: 'Respawn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respawn
      @respawn = Respawn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respawn_params
      params.require(:respawn).permit(:game_id, :name)
    end
end
