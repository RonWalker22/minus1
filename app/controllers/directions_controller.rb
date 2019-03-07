class DirectionsController < ApplicationController
  before_action :add_step_to_params, only: [:create]
  before_action :set_direction, only: [:show, :edit, :update, :destroy]
  before_action :set_variables, only: [:show, :new, :edit]
  before_action :set_directions_variables, only: [:show]

  # GET /directions
  # GET /directions.json
  def index
    @directions = Direction.all
  end

  # GET /directions/1
  # GET /directions/1.json
  def show; end

  # GET /directions/new
  def new
    @direction = Direction.new
  end

  # GET /directions/1/edit
  def edit; end

  # POST /directions
  # POST /directions.json
  def create
    @direction = Direction.new(direction_params)

    respond_to do |format|
      if @direction.save
        format.html { redirect_to @direction, notice: 'Direction was successfully created.' }
        format.json { render :show, status: :created, location: @direction }
      else
        format.html { render :new }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directions/1
  # PATCH/PUT /directions/1.json
  def update
    respond_to do |format|
      if @direction.update(direction_params)
        format.html { redirect_to @direction, notice: 'Direction was successfully updated.' }
        format.json { render :show, status: :ok, location: @direction }
      else
        format.html { render :edit }
        format.json { render json: @direction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directions/1
  # DELETE /directions/1.json
  def destroy
    @direction.destroy
    respond_to do |format|
      format.html { redirect_to directions_url, notice: 'Direction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_direction
      @direction = Direction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def direction_params
      params.fetch(:direction, {}).permit(:name,
                                           :content,
                                           :private,
                                           :recipe_id,
                                           :step)
    end

    def add_step_to_params
      recipe = Recipe.find(params[:direction][:recipe_id])
      params[:direction][:step] = recipe.directions.count + 1
    end

    def set_variables
      recipe = params[:recipe]
      @recipe = recipe ? Recipe.find(recipe) : @direction.recipe
      @objective = @recipe.objective
      @strategy = @objective.strategy
      @game = @strategy.game
    end

    def set_directions_variables
      @directions = @recipe.directions.order(:step)
      return unless @directions.count > 1

      create_previous_next
    end

    def create_previous_next
      @directions.each_with_index do |direction, index|
        next unless direction.id == @direction.id

        case index
        when 0 then return @next_direction = @directions[index + 1]
        else @next_direction = @directions[index + 1]
        end
        @previous_direction = @directions[index - 1]
      end
    end
end
