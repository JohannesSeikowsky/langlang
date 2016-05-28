class ViewsController < ApplicationController

  before_action :record_words_in_session, only: [:learning]

  def home
    if logged_in?
      redirect_to learning_path
    else
      render 'home'
    end
  end

  def learning

    current_user.update_attribute(:known_word, params["current_word"])
    
    # logged in?
    if current_user
      # get word 
      @word = Word.get_random
      # word already in session?
      if session[:words].include?(@word.english)
        redirect_to learning_path
      else
        # put word in session & continue
        session[:words] << @word.english
        respond_to do |format|
          format.html { render "learning" }
          format.js
        end
      end
    # if not logged in
    else
      root_with_notice("please log in.")
    end
  end

  def record_words_in_session
    session[:words] ||= []
  end

end