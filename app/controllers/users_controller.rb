class UsersController < ApplicationController
    def new
        # shows our signup form
        @user = User.new
    end

    def create
        # handeles our signup logic
        form_params = params.require(:user).permit(:email, :password, :password_confirmation)

        @user = User.new(form_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end
    
end
