# Oop::Workshop

This is a workshop on Object-Oriented Design (https://mokevnin.timepad.ru/event/792995/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oop-workshop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install oop-workshop

## Usage

```ruby
location = Oop::Workshop.search_location_by_ip '134.234.3.2'
location.query # => "134.234.3.2"
location.status # => "success"
location.country # => "United States"
location.city # => "Sierra Vista (Fort Huachuca)"
location.country_code # => "US"
location.lat # => 31.5552
location.lon # => -110.35
location.region_name # => "Arizona"
location.timezone # => "America/Phoenix"
location.zip # => "85613"
```
