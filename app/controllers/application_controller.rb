class ApplicationController < ActionController::Base
  before_action :check_signed_in, unless: :guests_controllers?

  include Pundit
  protect_from_forgery with: :exception

  private

    def pundit_user
      current_operator
    end

    def add_contributor(contribution)
      current_operator.add_role(:contributor, contribution) unless current_operator.has_role?(:contributor, contribution)
    end

    def check_signed_in
      return if operator_signed_in?

      flash[:notice] = 'You must be signed in to access that area.'
      redirect_to(new_operator_session_path)
    end

    def guests_controllers?
      devise_controller? || controller_name == 'static_pages'
    end
end
