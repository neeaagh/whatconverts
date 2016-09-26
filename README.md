# The WhatConverts Ruby Gem

A Ruby interface for the [WhatConverts API](https://whatconverts.com/api). 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'whatconverts'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install whatconverts

## Usage

```ruby
client = Whatconverts::Client.new do |config|
  config.api_token = 'YOUR_API_TOKEN'
  config.api_secret = 'YOUR_API_SECRET'
end

# retrieve all
client.leads
client.accounts
client.profiles(account_id)

# retrieving with param filtering
client.leads(lead_type: 'phone_call', lead_status: 'unique')
client.accounts(accounts_per_page: 100)
client.profiles(account_id, profiles_per_page: 100)

# fetching by ID
client.lead(lead_id)
client.account(account_id)
client.profile(account_id, profile_id)

# creation
client.create_lead(
  lead_type: 'Web Form',
  form_name: 'My Form'
)
client.create_account(account_name: 'Test Account')
client.create_profile(account_id, profile_name: 'Test Profile')

# editing
client.edit_lead(lead_id, lead_source: 'google')
client.edit_account(account_id, account_name: 'Test Account 2')
client.edit_profile(account_id, profile_id, profile_name: 'Test Profile 2')

# deletion
client.delete_account(account_id)
client.delete_profile(account_id, profile_id)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neeaagh/whatconverts.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

