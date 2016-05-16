class UsersController < ApplicationController

  def login
    @user = User.find_by_email(params[:login][:email])
    if @user && @user.check_password(params[:login][:password])
      session[:id] = @user.id
      redirect_to learning_path, notice: "you are logged in"
    else
      redirect_to root_path, notice: "Sorry. you could not be logged in."
    end
  end

  def new_user
    @user = User.create(params_of_user)
    session[:id] = @user.id
    redirect_to learning_path, notice: "you have signed up." 
  end

  def logout
    @user = User.find(session[:id])
    session[:id] = nil
    redirect_to root_path, notice: "you are logged out." if session[:id] != @user.id
  end


  private

  def params_of_user
    params.require(:new_user).permit(:email, :password)
  end

  def params_of_login
    params.require(:login).permit(:email, :password)
  end

end
