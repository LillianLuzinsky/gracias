class SessionsController < ApplicationController
  def new
    # shows our login form
  end

  def create
    # handeles our login logic

puts "==============================================="
puts "HANDELING LOGIN"

    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/journal'
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
  
end
