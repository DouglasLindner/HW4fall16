class SessionsController < ApplicationController

  def user_params
    params.require(:user).permit(:user_id, :email)
  end

  def new
    # default: render 'new' template
  end

  def create
    current_user = User.find_by user_id: user_params[:user_id]
    if current_user != nil && current_user.user_id == user_params[:user_id] && current_user.email == user_params[:email]
      session[:session_token] = current_user.session_token
      redirect_to movies_path
    else
      flash[:notice] = "Incorrect username or password"
      redirect_to login_path
    end
  end
  
  def destroy
    @current_user = nil
    session[:session_token] = nil
    redirect_to movies_path
  end

end
