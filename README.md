# zipcode-ch

Find swiss city data by zip code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zipcode-ch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zipcode-ch

## Usage

```ruby
require 'zipcode-ch'

# use it directly
z = ZipCode::CH.new
z.load                         # builds memory-backed global index

z.search(:zip, '8000')         # exact zip code search

# use it through ZipCode::DB
ZipCode::DB.for(:ch).load
ZipCode::DB.for(:ch).search(:zip, '8000')
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/timoschilling/zipcode-ch.
