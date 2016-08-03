module Whatconverts
  class HttpService
    API_URL = 'https://app.whatconverts.com/api/v1/'.freeze

    def make_request(endpoint, params = {})
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
