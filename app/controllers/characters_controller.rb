class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  # GET /characters
  # GET /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1
  # GET /characters/1.json
  def show; end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
    begin
      authorize @character
      @game = @character.game
    rescue Pundit::NotAuthorizedError
      flash[:alert] = "You are not authorized to edit this resource."
      redirect_to(request.referrer || root_path)
    end
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    add_contributor(@character.game) if @character.save

    redirect_back fallback_location: root_path
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    authorize @character
    unless @character.update(character_params)
      flash[:notice] = 'Character was not created.'
    end
    redirect_to game_path(@character.game)
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    authorize @character
    unless @character.destroy
      flash[:alert] = 'Character was not destroyed.'
    end
    redirect_to game_path(@character.game)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params[:character][:operator_id] = current_operator.id
      params.require(:character).permit(:game_id, :name, :operator_id)
    end
end
