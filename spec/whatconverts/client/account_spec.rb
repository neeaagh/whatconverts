require 'spec_helper'

describe Whatconverts::Client::Account do
  before do
    @client = Whatconverts::Client.new do |client|
      client.api_token = 'API TOKEN'
      client.api_secret = 'API SECRET'
    end
  end

  describe '#accounts' do

    it 'returns all accounts' do
      stub_get('accounts').to_return(body: fixture('accounts_all.json'))

      accounts = @client.accounts
      expect(a_get('accounts')).to have_been_made
      expect(accounts['accounts'].count).to eq(3)
    end

    it 'returns filtered accounts' do
      stub_get('accounts', { accounts_per_page: 1 }).to_return(body: fixture('accounts_filtered.json'))

      accounts = @client.accounts(accounts_per_page: 1)
      expect(a_get('accounts', accounts_per_page: 1)).to have_been_made
      expect(accounts['accounts'].count).to eq(1)
      expect(accounts['accounts'].first['account_name']).to eq('Auto Store')
    end
  end

end
