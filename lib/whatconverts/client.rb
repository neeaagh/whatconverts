module Whatconverts
  class Client
    API_URL = 'https://app.whatconverts.com/api/v1/'.freeze

    attr_accessor :api_token, :api_secret
    
    def initialize
      yield self if block_given?
    end
  end
end
