class SessionsController < ApplicationController
  def create
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      session[:name] = user.name
      redirect_to user_profile_path
  end

end
