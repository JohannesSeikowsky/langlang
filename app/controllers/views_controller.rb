class ViewsController < ApplicationController

  before_action :initialize_sessions, only: [:learning]

  def home
    if logged_in?
      redirect_to learning_path
    else
      render 'home'
    end
  end

  def learning
    if current_user
      # if user is logged in:
      @word = Word.get_random
      unless session[:words].include?(@word.english)
        # count and non-repetition features
        session[:words] << @word.english
        session[:count] += 1
        # request handling
        respond_to do |format|
          format.html { render "learning" }
          format.js
        end
      else
        # if word has already been asked for this sessions - repeat request cycle.
        redirect_to learning_path
      end
    else
      # if user is not logged in:
      root_with_notice("please log in.")
    end
  end

  private
  def initialize_sessions
    session[:words] ||= []
    session[:count] ||= 0
  end

end
