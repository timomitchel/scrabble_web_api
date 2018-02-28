class User < ApplicationRecord
  has_many :plays

  def score
    plays.reduce(0) do |result, play|
      result += play.score
      result
    end
  end
end
