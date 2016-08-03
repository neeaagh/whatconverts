module Whatconverts
  class Client

    attr_accessor :api_token, :api_secret, :http_service
    
    def initialize
      @http_service = HttpService.new
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

  end
end
