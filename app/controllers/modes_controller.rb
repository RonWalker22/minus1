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
    @game = @mode.game
  end

  # POST /modes
  # POST /modes.json
  def create
    mode = Mode.new(mode_params)
    add_contributor(mode.game) if mode.save

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /modes/1
  # PATCH/PUT /modes/1.json
  def update
    authorize @mode

    if @mode.update(mode_params)
      flash[:notice] = "Mode was successfully updated."
    else 
      flash[:notice] = "Mode was successfully updated."
    end
    redirect_to game_path(@mode.game)
  end

  # DELETE /modes/1
  # DELETE /modes/1.json
  def destroy
    authorize @mode
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
      params[:mode][:operator_id] = current_operator.id
      params.require(:mode).permit(:name, :game_id, :operator_id)
    end
end
