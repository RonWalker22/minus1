class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :set_variables, only: [:new, :show, :edit]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @directions = @recipe.directions
    @ingredients = @recipe.ingredients
    @direction = Direction.new
    @ingredient = Ingredient.new
    @primaries = set_loadout('Primary')
    @secondaries = set_loadout('Secondary')
    @sights = set_loadout('Sight')
    @grips = set_loadout('Grip')
    @attachments = set_loadout('Attachment')
    @utilities = set_loadout('Utility')
    loadouts = @recipe.ingredients.where(piece_type: 'Loadout')

    @parents = loadouts.select do |ingredient|
      ingredient.piece.kind == 'Secondary' || ingredient.piece.kind == 'Primary'
    end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.uuid = SecureRandom.uuid
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe.objective}
        format.json { render :show, status: :created, location: @recipe.objective }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    authorize @recipe
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    authorize @recipe
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url}
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params[:recipe][:commander_id] = current_operator.id
      params.fetch(:recipe, {}).permit(:name, :objective_id, :commander_id)
    end

    def set_variables
      params_obj = params[:obj]
      @objective = params_obj ? Objective.find(params_obj) : @recipe.objective
      @strategy = @objective.strategy
      @game = @strategy.game
    end

    def set_loadout(kind)
      @game.loadouts.where(kind: kind).reject do |target|
        ids = @recipe.ingredients.where(piece_type: 'Loadout').pluck(:piece_id)

        ids.include?(target.id)
      end 
    end
end
