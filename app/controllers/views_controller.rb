class ViewsController < ApplicationController

  def home
  end

  def learning
    if session[:id]
      session[:words] ||= []
      @word = Word.get_random
      session[:words] << @word.english
      render "learning"
    else
      root_with_notice("please log in.")
    end
  end

end