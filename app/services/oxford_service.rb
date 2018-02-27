class OxfordService 

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def faraday_connect
   Faraday.new(url: 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
          faraday.request  :url_encoded            
          faraday.response :logger                  
          faraday.adapter  Faraday.default_adapter
      end
  end

  def response_inflections
    faraday_connect.get do |req|
        req.url "inflections/en/#{word}"
        req.headers["app_id"] = ENV['app_id']
        req.headers["app_key"] = ENV['app_key']
      end
  end

  def valid_json?(json)
    JSON.parse(json)
    return true
    rescue JSON::ParserError => e
    return false
  end

  def check_response
    if valid_json?(response_inflections.body)
        result = JSON.parse(response_inflections.body, symbolize_names: true)[:results]
        WordFeatures.new(result.first[:lexicalEntries].first[:inflectionOf].first)
    else
      false
    end
  end
end