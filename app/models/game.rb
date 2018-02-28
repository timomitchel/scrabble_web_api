class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

  def scores
      [{
        user_id: player_1.id,
        score: player_1.score
      }, {
        user_id: player_2.id,
        score: player_2.score
      }]
  end

  
end
