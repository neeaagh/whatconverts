$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'whatconverts'

require 'webmock/rspec'

def stub_get(path)
  stub_request(:get, Whatconverts::HttpService::API_URL + path)
    .with(basic_auth: ['API TOKEN', 'API SECRET'])
end

def a_get(path)
  a_request(:get, Whatconverts::HttpService::API_URL + path)
end
