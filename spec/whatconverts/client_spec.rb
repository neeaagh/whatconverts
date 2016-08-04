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
      stub_get('leads').to_return(body: fixture('leads_all.json'))
      
      leads = @client.leads
      expect(a_get('leads')).to have_been_made
      expect(leads['leads'].count).to eq(3)
    end

    it 'returns filtered leads' do
      stub_get('leads', { lead_type: 'phone_call' }).to_return(body: fixture('leads_filtered.json'))

      leads = @client.leads(lead_type: 'phone_call')
      expect(a_get('leads', lead_type: 'phone_call')).to have_been_made
      expect(leads['leads'].count).to eq(1)
      expect(leads['leads'].first['lead_type']).to eq('Phone Call')
    end
  end

  describe '#lead' do

    it 'returns the correct lead' do
      lead_id = 123
      stub_get("leads/#{lead_id}").to_return(body: fixture('lead.json'))
      lead = @client.lead(lead_id)
      expect(a_get("leads/#{lead_id}")).to have_been_made
      expect(lead['leads'].first['lead_id']).to eq(lead_id)
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
