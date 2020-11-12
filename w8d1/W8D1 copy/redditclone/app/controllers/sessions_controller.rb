class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = ['Invalid username or password']
            render :new
        end
    end

    def destroy
        logout!
    end
end
spi\



before_action :require_logged_in, only: [:create, :destroy]

# def new
#     @goal = Goal.new
#     render :new
# end

def create
    @goal = Goal.new(goal_params) #space
    @goal.user_id = params[:user_id]
    if !@goal.save 
        flash[:errors] = ["Details can't be blank"]
    end
    redirect_to user_url(params[:user_id]) #where does it redirect
end

def destroy
    @goal = current_user.goals.find_by(id: params[:id])
    if @goal && @goal.destroy 
        redirect_to users_url #where does it redirect
    end
end

def goal_params #space
    params.require(:goal).permit(:) #params
end


helper_method :current_user, :logged_in?

def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
end

def require_logged_in
    redirect_to new_session_url unless logged_in?
end

def logged_in?
    !!current_user
end

def login(user)
    session[:session_token] = user.reset_session_token!
end

def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
end



helper_method :current_user, :logged_in?

def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
end

def require_logged_in
    redirect_to new_session_url unless logged_in?
end

def logged_in?
    !!current_user
end

def login(user)
    session[:session_token] = user.reset_session_token!
end

def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_user = nil
end