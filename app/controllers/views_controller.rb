class ViewsController < ApplicationController

  before_action :initialize_sessions, only: [ :learning ]

  def home
    if logged_in?
      redirect_to learning_path
    else
      render 'home'
    end
  end

  def learning
    if current_user
      @word = Word.get_random
      unless session[:words].include?(@word.english)
        session[:words] << @word.english
        respond_to do |format|
          format.html { render "learning" }
          format.js
        end
      else
        redirect_to learning_path
      end
    else
      root_with_notice("please log in.")
    end
  end

  private
  def initialize_sessions
    session[:words] ||= []
  end

end
