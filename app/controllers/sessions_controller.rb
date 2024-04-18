include JwtHelper

class SessionsController < ApplicationController
  include CurrentUserConcern
  def session_params
    params.require(:user).permit(:email, :password)
  end
  def create
    user = User.find_by(email: session_params[:email])
    puts "User found: #{user.inspect}"
  if user && user.authenticate(params["user"]["password"])
    token = JwtHelper.encode({ user_id: user.id })
    session[:id] = user.id 
    render json: {
      status: :created,
      logged_in: true,
      user: user
    }
    puts "Login is successful"
  else

    logger.error("Login failed for email: #{params["user"]["email"]}")
    render json: { logged_in: false }
  end
end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { 
      status: 200, 
      logged_out: true 
    }
  end
end