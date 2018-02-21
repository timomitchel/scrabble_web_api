class WelcomeController < ApplicationController
  def index
    word = params["q"]
    if params['commit'] == 'Validate Word'
      response = OxfordService.new(params['q']).check_response
      if response == false
        flash[:error] = "#{word} is not a valid word"
      else
        flash[:success] = "#{word} is a valid word and its root form is '#{response}''"
        redirect_to root_path
      end
    end
  end
end
