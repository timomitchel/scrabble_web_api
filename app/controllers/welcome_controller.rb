class WelcomeController < ApplicationController
  def index
    x = Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
        faraday.request  :url_encoded            
        faraday.response :logger                  
        faraday.adapter  Faraday.default_adapter
    end
    response = x.get do |req|
      req.url "entries/en/city/synonyms"
      req.headers["app_id"] = ENV['app_id']
      req.headers["app_key"] = ENV['app_key']
    end
    result = JSON.parse(response.body, symbolize_names: true)
  end
end
