class WelcomeController < ApplicationController
  def index
    if params['commit'] == 'Validate Word'
      x = Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
          faraday.request  :url_encoded            
          faraday.response :logger                  
          faraday.adapter  Faraday.default_adapter
      end
      word = params["q"]
      response = x.get do |req|
        req.url "inflections/en/#{word}"
        req.headers["app_id"] = ENV['app_id']
        req.headers["app_key"] = ENV['app_key']
      end
      if JSON.parse(response.body).class == Hash
        result = JSON.parse(response.body, symbolize_names: true)[:results]
        root_word = result.first[:lexicalEntries].first[:inflectionOf].first[:id]
        flash[:success] = "#{word} is a valid word and its root form is '#{root_word}''"
      else
        flash[:error] = "#{word} is not a valid word"
      end
    end
  end
end
