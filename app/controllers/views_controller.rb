class ViewsController < ApplicationController

  def home
  end

  def learning
    @word = Word.get_random
  end

end