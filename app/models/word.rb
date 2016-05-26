class Word < ActiveRecord::Base

  def self.get_random
    order("RANDOM()").first
  end

end
