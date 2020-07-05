require 'json'
require 'net/http'
require 'uri'

module ApiTest
  class APIError < StandardError; end
  class APITimeoutError < APIError; end

  class Service
    HOST_URL = "https://biodata.herokuapp.com"

    def get_resume
      resume = parsed_response
      if resume.nil?
        raise APIError, "Blank response"
      end
      resume
    end

    private

    def parsed_response
      uri = URI(HOST_URL)
      response = Net::HTTP.get_response(uri)
      !response.body.empty? ? JSON.parse(response.body) : nil
    rescue Timeout::Error => e do
      raise APITimeoutError, e.message
    end
  end
end
