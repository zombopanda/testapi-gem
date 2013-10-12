## Installation

    $ rake install

## Usage

```ruby
require 'testapi'
@api = Testapi::Client.new url: 'http://localhost:9393'
begin
  @api.add \
    first_name: 'Ivan',
    last_name: 'Ivanov',
    email: 'test@gmail.com',
    mobile: '+380631234567',
    permission_type: 'permanent',
    channel: 'sms+email',
    company_name: 'Company'

  puts 'success'
rescue Exception => e
  p e
end
```
