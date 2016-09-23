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

  describe '#account' do

    it 'returns the correct account' do
      account_id = 33333
      stub_get("accounts/#{account_id}").to_return(body: fixture('account.json'))
      account = @client.account(account_id)
      expect(a_get("accounts/#{account_id}")).to have_been_made
      expect(account['accounts'].first['account_id']).to eq(account_id)
    end
  end

  describe '#create_account' do

    it 'creates an account' do
      params = {
        account_name: 'Test Account'
      }
      stub_post('accounts', params).to_return(body: '{"account_id":123, "account_name":"Test Account"}')
      response = @client.create_account(params)
      expect(a_post('accounts', params)).to have_been_made
      expect(response['account_id']).to eq(123)
      expect(response['account_name']).to eq('Test Account')
    end
  end

  describe '#edit_account' do

    it 'updates an account' do
      params = { account_name: 'Test Account 2' }
      account_id = 123
      stub_post("accounts/#{account_id}", params).to_return(body: '{"account_id": 123, "account_name":"Test Account 2"}')
      response = @client.edit_account(account_id, params)
      expect(a_post("accounts/#{account_id}", params)).to have_been_made
      expect(response['account_name']).to eq('Test Account 2')
    end
  end

  describe '#delete_account' do

    it ' deletes an account' do
      account_id = 123
      stub_delete("accounts/#{account_id}").to_return(body: '{"account_id":123}')
      response = @client.delete_account(account_id)
      expect(a_delete("accounts/#{account_id}")).to have_been_made
      expect(response['account_id']).to eq(account_id)      
    end
  end

end
