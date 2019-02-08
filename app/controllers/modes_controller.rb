class ModesController < ApplicationController
  before_action :set_mode, only: [:show, :edit, :update, :destroy]

  # GET /modes
  # GET /modes.json
  def index
    @modes = Mode.all
  end

  # GET /modes/1
  # GET /modes/1.json
  def show
  end

  # GET /modes/new
  def new
    @mode = Mode.new
  end

  # GET /modes/1/edit
  def edit
    @game = Game.find params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.exclude?(current_operator.id)
      return redirect_back fallback_location: root_path
    end
  end

  # POST /modes
  # POST /modes.json
  def create
    @game = Game.find mode_params[:game_id]
    maintainers_ids = @game.maintainers.ids

    if maintainers_ids.include?(current_operator.id)
      mode = Mode.new(mode_params)
      mode.save
    end

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /modes/1
  # PATCH/PUT /modes/1.json
  def update
    @game = Game.find mode_params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      if @mode.update(mode_params)
        flash[:notice] = "Mode was successfully updated."
      else 
        flash[:notice] = "Mode was successfully updated."
      end
    end 
    redirect_to game_path(@game)
  end

  # DELETE /modes/1
  # DELETE /modes/1.json
  def destroy
    if @mode.destroy
      flash[:notice] = "Mode was successfully destroyed."
    else
      flash[:alert] = "Mode was not destroyed."
    end
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mode
      @mode = Mode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mode_params
      params.require(:mode).permit(:name, :game_id)
    end
end
