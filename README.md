Work in Progress - not ready yet
=======================
SpreeKitchenSinkZones
=====================

This extension builds off of [spree_city_zones](https://github.com/scudco/spree_city_zones).  

The idea here is to provide one extension for every conceivable zone type (the first addition being zip codes)

Installation
------------

Add spree_kitchen_sink_zones to your Gemfile:

```ruby
gem 'spree_kitchen_sink_zones'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_kitchen_sink_zones:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_kitchen_sink_zones/factories'
```

Copyright (c) 2013 Jeff Squires, released under the New BSD License
