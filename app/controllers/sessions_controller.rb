class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if @user
      login(@user)
      redirect_to circles_url
    else
      flash.now[:errors] = ["Invalid Username or Password"]
      render :new
    end
  end
  
  def destroy
    logout
    redirect_to new_session_url
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
