class ViewsController < ApplicationController

  before_action :record_words_in_session, only: [:learning]

  def home
  end

  def learning
    # make sure user is logged in
    if current_user
      # next Word and make sure it hasnt already been asked for in this session  
      @word = Word.get_random
      if session[:words].include?(@word.english)
        # only continue if not all Words have been covered in session to avoid infinite loop crash. 
        if session[:words].count << Word.count
          redirect_to learning_path
        else
          root_with_notice("you have covered all words in this course. thank you.")
        end
      else
        # save word in current session and generate the view.
        session[:words] << @word.english
        respond_to do |format|
          format.html { render "learning" }
          format.js
        end
      end

    else
      root_with_notice("please log in.")
    end
  end

  def record_words_in_session
    session[:words] ||= []
  end

end