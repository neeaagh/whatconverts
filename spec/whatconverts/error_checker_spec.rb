require 'spec_helper'

describe Whatconverts::ErrorChecker do
  before do
    @client = Whatconverts::Client.new do |client|
      client.api_token = 'API TOKEN'
      client.api_secret = 'API SECRET'
    end
  end

 
  context 'When response status is 500' do

    it 'raises ApiError' do
      stub_get('leads').to_return(status: 500)
      expect { @client.leads }.to raise_error(Whatconverts::ApiError)
    end

  end

  context 'when response status is 401' do

    it 'raises AuthError' do
      stub_get('leads').to_return(status: 401)
      expect { @client.leads }.to raise_error(Whatconverts::AuthError)
    end
  end

  context 'when an error is raised' do

    it 'returns the proper error message' do
      stub_get("leads/999").to_return(body: '{"error_message":"Invalid lead ID."}', status: 400)
      expect { @client.lead(999) }.to raise_error(Whatconverts::ApiError, 'Invalid lead ID.')
    end
  end
end
