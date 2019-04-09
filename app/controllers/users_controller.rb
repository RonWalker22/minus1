class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show; end

  def create_api_key
    op_create_at = current_user.created_at.strftime("%y%d%I%M%S")
    key = SecureRandom.urlsafe_base64 + op_create_at

    current_user.update_attributes api_key: Digest::SHA2.hexdigest(key)

    render html: "<p>Don't share your api key with anyone.</p> <div>#{key}</div>".html_safe
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
