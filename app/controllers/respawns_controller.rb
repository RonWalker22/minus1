class RespawnsController < ApplicationController
  before_action :set_respawn, only: [:show, :edit, :update, :destroy]

  # GET /respawns
  # GET /respawns.json
  def index
    @respawns = Respawn.all
  end

  # GET /respawns/1
  # GET /respawns/1.json
  def show; end

  # GET /respawns/new
  def new
    @respawn = Respawn.new
  end

  # GET /respawns/1/edit
  def edit
    @game = @respawn.game
  end

  # POST /respawns
  # POST /respawns.json
  def create
    @respawn = Respawn.new(respawn_params)
    levels = @respawn.game.levels.ids

    if @respawn.save
      params[:respawn][:level_id].each do |level_id|
        level_id = level_id.to_i
        next if levels.exclude?(level_id)

        LevelRespawn.create! level_id: level_id, respawn_id: @respawn.id
      end
      add_contributor(@respawn.game)
    else
      flash[:alter] = 'Respawn was not created.'
    end
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /respawns/1
  # PATCH/PUT /respawns/1.json
  def update
    authorize @respawn
    levels = @respawn.game.levels.ids

    if @respawn.update(respawn_params)
      LevelRespawn.where(respawn_id: @respawn.id).destroy_all
      params[:respawn][:level_id].each do |level_id|
        level_id = level_id.to_i
        next if levels.exclude?(level_id)

        LevelRespawn.create! level_id: level_id, respawn_id: @respawn.id
      end
    else
      flash[:notice] = 'Respawn was not created.'
    end
    redirect_to game_path(@respawn.game)
  end

  # DELETE /respawns/1
  # DELETE /respawns/1.json
  def destroy
    authorize @respawn
    unless @respawn.destroy
      flash[:alter] = 'Respawn was not destroyed.'
    end
    redirect_to game_path(@respawn.game)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_respawn
      @respawn = Respawn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respawn_params
      params[:respawn][:operator_id] = current_operator.id
      params.require(:respawn).permit(:game_id, :name, :operator_id)
    end
end
