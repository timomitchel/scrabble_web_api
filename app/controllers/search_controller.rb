class SearchController < ApplicationController

  def index
    word = params["q"]
      response = OxfordService.new(params['q']).check_response
      if response == false
        flash[:error] = "#{word} is not a valid word"
      else
        @word_feature = response
      end
  end

end