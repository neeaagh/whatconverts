require 'spec_helper'

describe Whatconverts::Client::Profile do
  before do
    @client = Whatconverts::Client.new do |client|
      client.api_token = 'API TOKEN'
      client.api_secret = 'API SECRET'
    end
    @account_id = 123
    @profiles_endpoint = "accounts/#{@account_id}/profiles"
  end

  describe '#profiles' do

    it 'returns all profiles' do
      stub_get(@profiles_endpoint).to_return(body: fixture('profiles_all.json'))

      profiles = @client.profiles(123)
      expect(a_get(@profiles_endpoint)).to have_been_made
      expect(profiles['profiles'].count).to eq(3)
    end

    it 'returns filtered profiles' do
      stub_get(@profiles_endpoint, { profiles_per_page: 1 }).to_return(body: fixture('profiles_filtered.json'))

      profiles = @client.profiles(@account_id, profiles_per_page: 1)
      expect(a_get(@profiles_endpoint, profiles_per_page: 1)).to have_been_made
      expect(profiles['profiles'].count).to eq(1)
      expect(profiles['profiles_per_page']).to eq(1)
    end
  end

  describe '#profile' do

    it 'returns the correct profile' do
      profile_id = 33333
      stub_get("#{@profiles_endpoint}/#{profile_id}").to_return(body: fixture('profile.json'))
      profile = @client.profile(@account_id, profile_id)
      expect(a_get("#{@profiles_endpoint}/#{profile_id}")).to have_been_made
      expect(profile['profiles'].first['profile_id']).to eq(profile_id)
    end
  end

  describe '#create_profile' do

    it 'creates a profile' do
      params = {
        profile_name: 'Test Profile'
      }
      stub_post(@profiles_endpoint, params)
        .to_return(
          body: '{"profile_id":123, "profile_name":"Test Profile", "date_created": "2016-06-24T17:24:42Z"}'
      )
      response = @client.create_profile(@account_id, params)
      expect(a_post(@profiles_endpoint, params)).to have_been_made
      expect(response['profile_id']).to eq(123)
      expect(response['profile_name']).to eq('Test Profile')
    end
  end

  describe '#edit_profile' do

    it 'updates an profile' do
      params = { profile_name: 'Test Profile 2' }
      profile_id = 123
      stub_post("#{@profiles_endpoint}/#{profile_id}", params)
        .to_return(
          body: '{"profile_id": 123, "profile_name":"Test Account 2"}, "date_created": "2016-06-24T17:24:42Z"}'
      )
      response = @client.edit_profile(@account_id, profile_id, params)
      expect(a_post("#{@profiles_endpoint}/#{profile_id}", params)).to have_been_made
      expect(response['profile_name']).to eq('Test Account 2')
    end
  end

  describe '#delete_profile' do

    it ' deletes an profile' do
      profile_id = 123
      stub_delete("#{@profiles_endpoint}/#{profile_id}").to_return(body: '{"profile_id":123}')
      response = @client.delete_profile(@account_id, profile_id)
      expect(a_delete("#{@profiles_endpoint}/#{profile_id}")).to have_been_made
      expect(response['profile_id']).to eq(profile_id)      
    end
  end

end
