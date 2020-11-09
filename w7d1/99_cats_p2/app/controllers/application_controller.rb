class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?


    def logged_in?
        !current_user.nil?
    end
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login_user!(user)
        session[:session_token] = user.reset_session_token
    end

    def already_signed_in
        redirect_to cats_url if current_user
    end
end
