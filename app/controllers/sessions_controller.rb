class SessionsController < ApplicationController
  def create
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      session[:image] = request.env['omniauth.auth'][:info][:image]
      flash[:success] = "Signed in"
      redirect_to user_profile_path
  end

  def destroy
  if current_user
    session.delete(:user_id)
  end
  flash[:success] = "Signed out"
  redirect_to root_path

  end

end
