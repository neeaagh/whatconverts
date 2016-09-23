module Whatconverts
  class Client
    module Profile
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

    end
  end
end
