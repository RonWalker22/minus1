class StrategiesController < ApplicationController
  before_action :set_strategy, only: [:show, :edit, :update, :destroy]

  # GET /strategies
  # GET /strategies.json
  def index
    @game = Game.find(current_operator.game_setting_id || 1)
    authorize @game
    @levels = @game.levels
    @modes = @game.modes
    @strategies = @game.strategies
  end

  # GET /strategies/1
  # GET /strategies/1.json
  def show
    @objectives = @strategy.objectives
    authorize @strategy
  end

  # GET /strategies/new
  def new
    @strategy = Strategy.new
  end

  # GET /strategies/1/edit
  def edit; end

  # POST /strategies
  # POST /strategies.json
  def create
    @strategy = Strategy.new(strategy_params)
    authorize @strategy

    respond_to do |format|
      if @strategy.save
        format.html { redirect_to @strategy, notice: 'Strategy was successfully created.' }
        format.json { render :show, status: :created, location: @strategy }
      else
        format.html { render :new }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategies/1
  # PATCH/PUT /strategies/1.json
  def update
    respond_to do |format|
      if @strategy.update(strategy_params)
        format.html { redirect_to @strategy, notice: 'Strategy was successfully updated.' }
        format.json { render :show, status: :ok, location: @strategy }
      else
        format.html { render :edit }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategies/1
  # DELETE /strategies/1.json
  def destroy
    @strategy.destroy
    respond_to do |format|
      format.html { redirect_to strategies_url, notice: 'Strategy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_strategy
      @strategy = Strategy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def strategy_params
      params[:strategy][:commander_id] = current_operator.id
      params.fetch(:strategy, {}).permit(:mode_id, :name, :commander_id, :level_id, :game_id)
    end
end
