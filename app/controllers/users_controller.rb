class UsersController < ApplicationController

  def new_user
    if save_new_user
      log_in
      learning_with_notice('Account created.')
    else
      root_with_notice('Try again.')
    end
  end

  def login
    if user_exists_and_checks_out?
      log_in
      learning_with_notice('Logged in.')
    else
      root_with_notice('Try again.')
    end
  end

  def logout
    log_out
    root_with_notice("Logged out.")
  end


  private
  def user_params
    params.require(:new_user).permit(:email, :password_provided)
  end

end
