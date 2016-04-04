class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:image] = request.env["omniauth.auth"][:info][:image]
    flash[:success] = "Signed in"
    redirect_to user_profile_path
  end

  def destroy
    session.delete(:user_id) if current_user
    flash[:success] = "Signed out"
    redirect_to root_path
  end
end
