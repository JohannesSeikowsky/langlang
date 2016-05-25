class Word < ActiveRecord::Base

  def self.get_random
    order("RANDOM()").first
    # Word.find(rand(1..Word.count))
  end

end
