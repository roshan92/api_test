require 'json'
require 'net/http'
require 'uri'

module ApiTest
  class APIError < StandardError; end
  class APITimeoutError < APIError; end

  class Service
    HOST_URL = "https://biodata.herokuapp.com"

    def get_resume
      
    end

    private

    def parsed_response
    end
  end
end
