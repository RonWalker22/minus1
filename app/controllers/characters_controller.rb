class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
    @game = Game.find params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.exclude?(current_operator.id)
      return redirect_back fallback_location: root_path
    end
  end

  # POST /characters
  # POST /characters.json
  def create
    @game = Game.find character_params[:game_id]
    maintainers_ids = @game.maintainers.ids

    if maintainers_ids.include?(current_operator.id)
      @character = Character.new(character_params)
      @character.save
    end

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    @game = Game.find character_params[:game_id]
    maintainers = @game.maintainers.ids

    if maintainers.include?(current_operator.id)
      if @character.update(character_params)
        flash[:notice] = "Character was successfully created."
      else 
        flash[:notice] = "Character was successfully created."
      end
    end 
    redirect_to game_path(@game)
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    if @character.destroy
      flash[:notice] = "Character was successfully destroyed."
    else
      flash[:alert] = "Character was not destroyed."
    end
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:game_id, :name)
    end
end
