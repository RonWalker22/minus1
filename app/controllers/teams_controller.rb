class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :join_team,
                                  :change_member_title]

  # GET /teams
  # GET /teams.json
  def index
    @game = current_operator.game_setting
    @teams = @game.teams
    @team = Team.new
    set_linkable_teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @members = OperatorTeam.includes(:operator).where(team_id: @team.id)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit; end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  def link_game
    game_id = params[:game_id]
    team_id = params[:id]
    GameTeam.create team_id: team_id, game_id: game_id
    redirect_to teams_path
  end

  def unlink_game
    GameTeam.find(team_id: @team.id, game_id: @game.id).destory
  end

  def join_team
    if params[:password] == @team.password || !@team.password
      unless @team.operators << current_operator
        flash.notice = 'You are not able to join this team.'
      end
    end
    redirect_to team_path(@team)
  end

  def change_member_title
    authorize @team
    members = OperatorTeam.find(params[:member_ids])

    members.each do |member|
      member.title = params[:title]
      member.save
    end
    redirect_to team_path(@team)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_game
      @game = params[:game]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params[:team][:commander_id] = current_operator.id
      params[:team][:password] = nil if params[:team][:password].empty?
      params.fetch(:team, {}).permit(:name, :commander_id, :password)
    end

    def set_linkable_teams
      @linkable_teams =
        current_operator.commander_teams.preload(:game_teams).select do |team|
          team.game_teams.pluck(:game_id).exclude?(@game.id)
        end
    end
    def authenticate
      authenticate_or_request_with_http_basic('Admin') do |password|
        password == 'password'
      end
    end
end
