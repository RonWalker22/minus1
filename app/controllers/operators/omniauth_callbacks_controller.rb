class Operators::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: [:steam]
  def steam
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @operator = Operator.from_omniauth(request.env['omniauth.auth'])

    if @operator.persisted?
      sign_in_and_redirect @operator
      set_flash_message(:notice, :success, kind: 'Steam') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
