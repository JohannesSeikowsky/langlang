class UsersController < ApplicationController

  def login
    if user_exists_and_checks_out?
      log_in_then
      root_with_notice('you are logged in')
    else
      root_with_notice('Sorry. you could not be logged in')
    end
  end

  def new_user
    if new_user_can_saved?
      log_in
      learning_with_notice('you have signed up.')
    else
      root_with_notice('fail. you have not signed up.')
    end
  end

  def logout
    log_out
    root_with_notice('you are logged out')
  end

  private

  def user_params
    params.require(:new_user).permit(:email, :password_provided)
  end

end
