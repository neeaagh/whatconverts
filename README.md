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

# retrieve leads
client.leads

# retrieve leads with param filtering
client.leads(lead_type: 'phone_call', lead_status: 'unique')

# fetch lead by ID
client.lead(999)

# create new lead
client.create_lead(
  lead_type: 'Web Form',
  form_name: 'My Form'
)

# edit existing lead
client.edit_lead(999, lead_source: 'google')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neeaagh/whatconverts.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

