class IngredientsController < ApplicationController
  before_action :add_step_to_params, only: [:create]
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :set_variables, only: [:show, :new, :edit]
  before_action :set_ingredients_variables, only: [:show]

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
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
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
      params.fetch(:ingredient, {}).permit(:name,
                                           :content,
                                           :private,
                                           :recipe_id,
                                           :step)
    end

    def add_step_to_params
      recipe = Recipe.find(params[:ingredient][:recipe_id])
      params[:ingredient][:step] = recipe.ingredients.count + 1
    end

    def set_variables
      recipe = params[:recipe]
      @recipe = recipe ? Recipe.find(recipe) : @ingredient.recipe
      @objective = @recipe.objective
      @strategy = @objective.strategy
    end

    def set_ingredients_variables
      @ingredients = @recipe.ingredients.order(:step)
      return unless @ingredients.count > 1

      create_previous_next
    end

    def create_previous_next
      @ingredients.each_with_index do |ingredient, index|
        next unless ingredient.id == @ingredient.id

        case index
        when 0 then return @next_ingredient = @ingredients[index + 1]
        else @next_ingredient = @ingredients[index + 1]
        end
        @previous_ingredient = @ingredients[index - 1]
      end
    end
end
