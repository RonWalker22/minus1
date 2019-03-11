class OperatorsController < ApplicationController
  before_action :set_operator, only: [:show]

  # GET /operators
  # GET /operators.json
  def index
    @operators = Operator.all
  end

  # GET /operators/1
  # GET /operators/1.json
  def show
    @op_prefix = @operator == current_operator ? 'My' : @operator.name + "'s"
  end

  def create_api_key
    op_create_at = current_operator.created_at.strftime("%y%d%I%M%S")
    key = SecureRandom.urlsafe_base64 + op_create_at

    current_operator.update_attributes api_key: Digest::SHA2.hexdigest(key)

    render html: "<p>Don't share your api key with anyone.</p> <div>#{key}</div>".html_safe
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_operator
      @operator = Operator.find(params[:id])
    end
end
