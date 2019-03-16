class LoadoutsController < ApplicationController
  before_action :set_loadout, only: [:show, :edit, :update, :destroy]

  # GET /loadouts
  # GET /loadouts.json
  def index
    @loadouts = Loadout.all
  end

  # GET /loadouts/1
  # GET /loadouts/1.json
  def show; end

  # GET /loadouts/new
  def new
    @loadout = Loadout.new
  end

  # GET /loadouts/1/edit
  def edit
    @game = @loadout.game
  end

  # POST /loadouts
  # POST /loadouts.json
  def create
    loadout = Loadout.new(loadout_params)
    add_contributor(loadout.game) if loadout.save

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /loadouts/1
  # PATCH/PUT /loadouts/1.json
  def update
    authorize @loadout

    flash[:notice] = if @loadout.update(loadout_params)
                       'Loadout was successfully updated.'
                     else
                       'Loadout was not updated.'
                     end
    redirect_to game_path(@loadout.game)
  end

  # DELETE /loadouts/1
  # DELETE /loadouts/1.json
  def destroy
    authorize @loadout
    if @loadout.destroy
      flash[:notice] = 'Loadout was successfully destroyed.'
    else
      flash[:alert] = 'Loadout was not destroyed.'
    end
    redirect_to game_path(@loadout.game)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_loadout
      @loadout = Loadout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loadout_params
      params[:loadout][:operator_id] = current_operator.id
      params.require(:loadout).permit(:name, :game_id, :operator_id, :kind)
    end
end
