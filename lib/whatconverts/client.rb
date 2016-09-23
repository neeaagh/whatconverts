require 'whatconverts/client/account'
require 'whatconverts/client/lead'
require 'whatconverts/client/profile'

module Whatconverts
  class Client

    attr_accessor :api_token, :api_secret

    include Whatconverts::Client::Account
    include Whatconverts::Client::Lead
    include Whatconverts::Client::Profile
    
    def initialize
      yield self if block_given?
    end

    private

    def http_service
      HttpService.new(api_token, api_secret)
    end

  end
end
