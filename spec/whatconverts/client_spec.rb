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
      stub_get('leads').to_return(body: File.new(File.expand_path('../../fixtures', __FILE__) + '/leads_all.json'))
      
      leads = @client.leads
      expect(a_get('leads')).to have_been_made
      expect(leads['leads'].count).to eq(3)
    end

    it 'returns filtered leads' do
      stub_get('leads', { lead_type: 'phone_call' }).to_return(body: File.new(File.expand_path('../../fixtures', __FILE__) + '/leads_filtered.json'))

      leads = @client.leads(lead_type: 'phone_call')
      expect(a_get('leads', lead_type: 'phone_call')).to have_been_made
      expect(leads['leads'].count).to eq(1)
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
