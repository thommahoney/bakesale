class SessionsController < ApplicationController
  def login
  end

  def create
    # make an http request to digits api to get user information
    response = Typhoeus.get(params[:apiUrl], headers: { 'Authorization' => params[:authHeader] })
    # if we get user information back, find a user with the given phone number
    user_information = JSON.parse(response.body)
    phone_number = user_information['phone_number']
    user = User.where(phone: phone_number).first_or_create
    # log in the user
    session[:user_id] = user.id

    render json: user
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
