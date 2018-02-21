class Game < ApplicationRecord
  belongs_to :player_1, class_name: "User", foreign_key: :player_1_id
  belongs_to :player_2, class_name: "User", foreign_key: :player_2_id

  has_many :plays

def as_json(options={})
  if options.key?(:only) or options.key?(:methods) or options.key?(:include) or options.key?(:except)
    h = super(options)
  else
    h = super(only: :id, 
              include: {:player_1 => {:only => [:id, :score]}, :player_2 => [:id, :score]}
              )
  end  
end

  
end
