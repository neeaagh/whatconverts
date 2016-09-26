module Whatconverts
  class Client
    module Profile
      def profiles(account_id, params = {})
        http_service.make_request("accounts/#{account_id}/profiles", params)
      end

      def profile(account_id, profile_id, params = {})
        http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}", params)
      end

      def create_profile(account_id, params = {})
        params.merge!(method: :post)
        http_service.make_request("accounts/#{account_id}/profiles", params)
      end

      def edit_profile(account_id, profile_id, params = {})
        params.merge!(method: :post)
        http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}", params)
      end

      def delete_profile(account_id, profile_id, params = {})
        params.merge!(method: :delete)
        http_service.make_request("accounts/#{account_id}/profiles/#{profile_id}", params)
      end

    end
  end
end
