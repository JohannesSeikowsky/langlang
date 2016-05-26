class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # make available in view layer
  helper_method :current_user, :logged_in?

  # general functions
  def current_user
    @current_user ||= User.find(cookies[:id]) if cookies[:id]
  end

  def logged_in?
    cookies[:id]
  end

  # functions for users controller
  def log_in
    cookies[:id] = { :value => @user.id, :expires => 1.year.from_now }
  end

  def log_out
    cookies.delete(:id)
  end

  def root
    redirect_to root_path
  end

  def root_with_notice(notice)
    redirect_to root_path, notice: "#{notice}"
  end

  def learning_with_notice(notice)
    redirect_to learning_path, notice: "#{notice}"
  end

  def user_exists_and_checks_out?
    @user = User.find_by_email(params[:login][:email])
    @user && @user.check_password(params[:login][:password_provided])
  end

  def new_user_can_saved?
    @user = User.new(user_params)
    @user.save
  end

end
