class SessionsController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user.nil?
            render :new
        else
            login_user!(user)
        end
    end

    def destroy
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        session[:session_token] = nil
        redirect to new_session_url
    end
end