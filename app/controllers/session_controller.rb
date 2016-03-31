class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      session[:name] = user.name
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
      redirect_to root_path
    end
    redirect_to user_profile_path
  end

end
