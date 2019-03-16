class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :set_variables, only: [:show, :new, :edit]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show; end

  # GET /ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /ingredients/1/edit
  def edit; end

  # POST /ingredients
  # POST /ingredients.json
  def create
    recipe_id = ingredient_params[:recipe_id]
    parent_id = params[:parent_id]
    piece_type = params[:ingredient][:piece_type]
    piece_id = case piece_type
               when 'Loadout'
                 loadout_kind = params[:ingredient][:loadout_kind]
                 params[:ingredient][loadout_kind.downcase + '_id']
               when 'Character'
                 params[:ingredient][:character_id]
               when 'Respawn'
                 params[:ingredient][:respawn_id]
               end
    ingredient = Ingredient.create(recipe_id: recipe_id,
                                    piece_id: piece_id,
                                    piece_type: piece_type,
                                    parent_id: parent_id)
    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:recipe_id, :piece_kind, :parent_id)
    end

    def set_variables
      recipe = params[:recipe]
      @recipe = recipe ? Recipe.find(recipe) : @ingredient.recipe
      @objective = @recipe.objective
      @strategy = @objective.strategy
      @game = @strategy.game
    end
end
