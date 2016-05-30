class UsersController < ApplicationController

  # methods are self explanatory and defined in the application controller file.
  def login
    if user_exists_and_checks_out?
      log_in
      learning_with_notice('Logged in.')
    else
      root_with_notice('Try again.')
    end
  end

  def new_user
    if new_user_can_saved?
      log_in
      learning_with_notice('Account created.')
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
