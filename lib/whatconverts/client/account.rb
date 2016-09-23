module Whatconverts
  class Client
    module Account
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

      def delete_account(account_id, params = {})
        params.merge!(method: :delete)
        http_service.make_request("accounts/#{account_id}", params)
      end

    end
  end
end
