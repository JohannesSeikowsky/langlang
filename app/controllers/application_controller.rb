class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # setting locale before every action
  before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  # make methods available in view layer
  helper_method :current_user, :logged_in?

  # redirect methods
  def root
    redirect_to root_path
  end

  def root_with_notice(notice)
    redirect_to root_path, notice: "#{notice}"
  end

  def languages_with_notice(notice)
    redirect_to languages_path, notice: "#{notice}"
  end

  def learning_with_notice(notice)
    redirect_to learning_path, notice: "#{notice}"
  end

  # login and out
  def log_in
    cookies.permanent[:id] = @user.id
  end

  def log_out
    cookies.delete(:id)
  end

  # about the current user
  def current_user
    @current_user ||= User.find(cookies[:id]) if cookies[:id]
  end

  def logged_in?
    cookies[:id]
  end

  # creating/authenticating user
  def save_new_user
    @user = User.new(user_params)
    @user.save
  end

  def user_exists_and_checks_out?
    @user = User.find_by_email(params[:login][:email])
    @user && @user.check_password(params[:login][:password_provided])
  end

end
