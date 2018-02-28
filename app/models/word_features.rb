class WordFeatures 

  attr_reader :id, :text

  def initialize(features)
    @id = features[:inflectionOf].first[:id]
    @text = features[:text]
  end
end