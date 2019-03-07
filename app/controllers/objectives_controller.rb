class ObjectivesController < ApplicationController
  before_action :set_objective, only: [:show, :edit, :update, :destroy]
  before_action :set_variables, only: [:show, :edit]
  before_action :set_strategy, only: [:show, :new, :edit]

  # GET /objectives
  # GET /objectives.json
  def index
    @objectives = Objective.all
  end

  # GET /objectives/1
  # GET /objectives/1.json
  def show
  end

  # GET /objectives/new
  def new
    @objective = Objective.new
  end

  # GET /objectives/1/edit
  def edit; end

  # POST /objectives
  # POST /objectives.json
  def create
    @objective = Objective.new(objective_params)
    direction = params[:objective][:direction]
    dependency = params[:objective][:dependency]
    next_id = params[:objective][:next_id]
    master_id = params[:objective][:master_id]
    @objective.next_id = nil if direction == "previous"
    @objective.master_id = nil if dependency == "slave"
  
    respond_to do |format|
      if @objective.save
        if direction == "previous" && next_id.to_i > 0
          @objective.previous.push Objective.find(next_id)
        end
        if dependency == "slave" && master_id.to_i > 0
          @objective.slaves.push Objective.find(master_id)
        end

        format.html { redirect_to @objective, notice: 'Objective was successfully created.' }
        format.json { render :show, status: :created, location: @objective }
      else
        format.html { render :new }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /objectives/1
  # PATCH/PUT /objectives/1.json
  def update
    respond_to do |format|
      if @objective.update(objective_params)
        format.html { redirect_to @objective, notice: 'Objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @objective }
      else
        format.html { render :edit }
        format.json { render json: @objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /objectives/1
  # DELETE /objectives/1.json
  def destroy
    @objective.destroy
    respond_to do |format|
      format.html { redirect_to objectives_url, notice: 'Objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_objective
      @objective = Objective.find(params[:id])
    end

    def set_strategy
      strat = params[:strat]
      @strategy = strat ? Strategy.find(strat) : @objective.strategy
      @strategies = Strategy.all
      @locations = @strategy.level.locations
    end

    def set_variables
      @next = Objective.find(@objective.next_id) if @objective.next
      @master = Objective.find(@objective.master_id) if @objective.master
      @recipes = @objective.recipes
      @game = @objective.strategy.game
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def objective_params
      # rubocop:disable Style/IfUnlessModifier
      if params[:objective][:strategy_id]
        params[:objective][:strategy_id] = params[:objective][:strategy_id].to_i
      end
      # rubocop:enable Style/IfUnlessModifier
      params.fetch(:objective, {}).permit(:name, :target_id, :action,
                                          :strategy_id, :min_ops, :max_ops,
                                          :priority, :next_id, :delay,
                                          :master_id)
    end
end
