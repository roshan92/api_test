require 'json'
require 'net/http'
require 'uri'

module ApiTest
  class APIError < StandardError; end
  class APITimeoutError < APIError; end

  class Service
    HOST_URL = "https://biodata.herokuapp.com"

    def get_resume
      raise APIError unless parsed_response
      parsed_response
    end

    private

    def parsed_response
      uri = URI(HOST_URL)
      response = Net::HTTP.get_response(uri)
      !response.body.empty? ? JSON.parse(response.body) : nil
    rescue Timeout::Error => e
      raise APITimeoutError, e.message
    end
  end
end
