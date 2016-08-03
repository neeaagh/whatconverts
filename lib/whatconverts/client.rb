module Whatconverts
  class Client

    attr_accessor :api_token, :api_secret
    
    def initialize
      yield self if block_given?
    end

    def leads(params = {})
      http_service.make_request('leads', params)
    end

    def lead(lead_id, params = {})
      http_service.make_request("leads/#{lead_id}", params)
    end

    def create_lead(params = {})
      params.merge!(method: :post)
      http_service.make_request('leads', params)
    end

    def edit_lead(lead_id, params = {})
      params.merge!(method: :post)
      http_service.make_request("leads/#{lead_id}", params)
    end

    private

    def http_service
      HttpService.new(api_token, api_secret)
    end

  end
end
