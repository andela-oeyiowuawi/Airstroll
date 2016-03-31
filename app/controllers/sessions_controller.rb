class SessionsController < ApplicationController
  def create
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      session[:name] = user.name
      session[:email] = user.email
      redirect_to user_profile_path
  end

  def destroy
  if current_user
    session.delete(:user_id)
  end
  redirect_to root_path

  end

end
