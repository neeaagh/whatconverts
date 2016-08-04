require 'spec_helper'

describe Whatconverts::Client do
  before do
    @client = Whatconverts::Client.new do |client|
      client.api_token = 'API TOKEN'
      client.api_secret = 'API SECRET'
    end
  end

  describe '#leads' do

    it 'returns all leads' do
      skip
    end

    it 'returns filtered leads' do
      skip
    end
  end

  describe '#lead' do

    it 'returns the correct lead' do
      skip
    end
  end

  describe '#create_lead' do

    it 'creates a lead' do
      skip
    end
  end

  describe '#edit_lead' do

    it 'updates a lead' do
      skip
    end
  end
end
