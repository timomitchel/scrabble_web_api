class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def player_1_score
    player_1.plays.where(game_id: self.id).sum(:score)
  end

  def player_2_score
    player_2.plays.where(game_id: self.id).sum(:score)  
  end

  
end
