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

### IP Geo

Библиотека, которая по ip адресу возвращает гео информацию используя сервис http://ip-api.com

#### Version 1

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

#### Version 2

```ruby
http = Oop::Workshop.
location = Oop::Workshop.search_location_by_ip '134.234.3.2'

location.query # => "134.234.3.2"
```

### Chain

https://github.com/mokevnin/oop-workshop-materials/blob/master/pipline/index.ex

Переложите это вычисление на ваш язык

```ruby
Oop::Workshop.chain # => "BINS"
```

### Weather

Утилита командной строки, которая возвращает информацию о погоде для указанного города. Она должна уметь обращаться к двум разным сервисам, каждый из которых выбирается флагом --service.

```ruby
weather --service <тут название> berlin
```
