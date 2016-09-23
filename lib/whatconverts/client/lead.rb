module Whatconverts
  class Client
    module Lead
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
end
