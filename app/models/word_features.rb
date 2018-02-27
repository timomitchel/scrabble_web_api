class WordFeatures 

  attr_reader :id, :text

  def initialize(features)
    @id = features[:id]
    @text = features[:text]
  end
end