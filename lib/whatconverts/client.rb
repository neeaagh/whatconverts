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

    def accounts(params= {})
      http_service.make_request('accounts', params)
    end

    def account(account_id, params = {})
      http_service.make_request("accounts/#{account_id}", params)
    end

    def create_account(params = {})
      params.merge!(method: :post)
      http_service.make_request('accounts', params)
    end

    def edit_account(account_id, params = {})
      params.merge!(method: :post)
      http_service.make_request("accounts/#{account_id}", params)
    end

    def delete_account(account_id)
      params.merge!(method: :delete)
      http_service.make_request('account_id', params)
    end

    def profiles(account_id)
      http_service.make_request("accounts/#{acount_id}/profiles")
    end

    def profile(account_id, profile_id)
      http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}")
    end

    def create_profile(account_id)
      params.merge!(method: :post)
      http_service.make_request("accounts/#{account_id}/profiles")
    end

    def edit_profile(account_id, profile_id)
      params.merge!(method: :post)
      http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}")
    end

    def delete_profile(account_id, profile_id)
      params.merge!(method: :delete)
      http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}")
    end

    private

    def http_service
      HttpService.new(api_token, api_secret)
    end

  end
end
