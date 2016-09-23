$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'whatconverts'

require 'webmock/rspec'

def stub_get(path, params = {})
  stub_request(:get, Whatconverts::HttpService::API_URL + path)
    .with(
      basic_auth: ['API TOKEN', 'API SECRET'],
      query: params
    )
end

def stub_post(path, params = {})
  stub_request(:post, Whatconverts::HttpService::API_URL + path)
    .with(
      basic_auth: ['API TOKEN', 'API SECRET'],
      body: params
    )
end

def stub_delete(path, params = {})
  stub_request(:delete, Whatconverts::HttpService::API_URL + path)
    .with(
      basic_auth: ['API TOKEN', 'API SECRET'],
      body: params
    )
end

def a_get(path, params = {})
  a_request(:get, Whatconverts::HttpService::API_URL + path)
    .with(query: params)
end

def a_post(path, params = {})
  a_request(:post, Whatconverts::HttpService::API_URL + path)
    .with(body: params)
end

def a_delete(path, params = {})
  a_request(:delete, Whatconverts::HttpService::API_URL + path)
    .with(body: params)
end

def fixture(path)
  File.new(File.expand_path('../fixtures', __FILE__) + '/' + path)
end
