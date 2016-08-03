module Whatconverts
  class Client
    API_URL = 'https://app.whatconverts.com/api/v1/'.freeze

    attr_accessor :api_token, :api_secret
    
    def initialize
      yield self if block_given?
    end

    def leads(params = {})
      http_service('leads', params)
    end

    def lead(lead_id, params = {})
      http_service("leads/#{lead_id}", params)
    end

    def create_lead(params = {})
      http_service('leads', method: :post)
    end

    def edit_lead(lead_id, params = {})
      params.merge!(method: :post)
      http_service("leads/#{lead_id}", params)
    end

    private

    def http_service(endpoint, params = {})
      method = params.delete(:method) { :get }
      response =  connection.send(method, endpoint, params)
      error = ErrorChecker.new(response).error_if_appropriate
      raise error if error
      JSON.parse(response.body)
    end

    def connection
      conn = Faraday.new(url: API_URL)
      conn.basic_auth(api_token, api_secret)
      conn
    end
  end
end
