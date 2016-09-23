require 'spec_helper'

describe Whatconverts::Client::Profile do
  before do
    @client = Whatconverts::Client.new do |client|
      client.api_token = 'API TOKEN'
      client.api_secret = 'API SECRET'
    end
  end

  describe '#profiles' do

  end

end
