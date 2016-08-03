module Whatconverts
  class ErrorChecker

    attr_reader :api_response
    
    def initialize(api_response)
      @api_response = api_response
    end

    def error_if_appropriate
      return AuthError.new(response_body) if is_auth_error?
      return ApiError.new(response_body) if is_error?
    end

    private

    def is_auth_error?
      api_response.status.to_i == 401
    end

    def is_error?
      api_response.status.to_i >= 400
    end

    def response_body
      JSON.parse(api_response.body)['error_message']
    rescue
      api_response.body
    end
  end
end
