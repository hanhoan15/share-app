# extend devise failure app to handle unauthentication redirect
#https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-when-the-user-can-not-be-authenticated

module Devise
  class CustomFailure < Devise::FailureApp
    def redirect_url
      new_user_registration_path
    end

    def respond
      if http_auth?
        http_auth
      else
        redirect
      end
    end
  end
end
