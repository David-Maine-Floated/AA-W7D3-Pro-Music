class SessionsController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in,  only: [:destroy]   #what are these????

    def new 
        @user = User.new 
        render :new
    end

    def create 
        @user = User.find_user_by_credentials(params[:user][:email], params[:user][:password])

        if @user 
            login(@user)
            redirect_to user_url(@user)
        else  
            @user = User.new(email: email)
            flash.now[:errors] = ['Invalid shiiiiii']
            render :new
        end
    end

    def destroy 
        logout!
        flash[:message] = ['we out']
        redirect_to new_session_url
    end 

end
