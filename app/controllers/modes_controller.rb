class ModesController < ApplicationController
  before_action :set_mode, only: [:show, :edit, :update, :destroy]

  # GET /modes
  # GET /modes.json
  def index
    @modes = Mode.all
  end

  # GET /modes/1
  # GET /modes/1.json
  def show; end

  # GET /modes/new
  def new
    @mode = Mode.new
  end

  # GET /modes/1/edit
  def edit
    begin
      authorize @mode
      @game = @mode.game
    rescue Pundit::NotAuthorizedError
      flash[:alert] = "You are not authorized to edit this resource."
      redirect_to(request.referrer || root_path)
    end
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

    unless @mode.update(mode_params)
      'Mode was not updated.'
    end
    redirect_to game_path(@mode.game)
  end

  # DELETE /modes/1
  # DELETE /modes/1.json
  def destroy
    authorize @mode
    unless @mode.destroy
      flash[:alert] = 'Mode was not destroyed.'
    end
    redirect_to game_path(@mode.game)
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
