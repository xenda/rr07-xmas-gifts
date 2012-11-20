class SessionsController < ApplicationController
  def create
    session[:current_user] = request.env["omniauth.auth"]["uid"]
    @user = User.find_or_create_by_uid(session[:current_user])
    redirect_to root_path
  end

  def destroy
    session[:current_user] = nil
  end
end
