class SessionsController < ApplicationController
  def login
  end

  def create
    user = User.where(user_params).first
    session[:user_id] = user.id

    redirect_to organizations_path
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  protected

  def user_params
    params.require(:user).permit(:phone)
  end
end
