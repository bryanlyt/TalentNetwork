module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_facebook(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        if is_navigational_format?
          set_flash_message(:notice, :success, kind: 'Facebook')
        end
      else
        session['devise.facebook_data'] = request.env['omniauth.auth']
        redirect_to new_user_registration_url
      end
    end
  end
end
