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

### Chain

https://github.com/mokevnin/oop-workshop-materials/blob/master/pipline/index.ex

Переложите это вычисление на ваш язык

```ruby
Oop::Workshop.chain # => "BINS"
```

### Weather

Утилита командной строки, которая возвращает информацию о погоде для указанного города. Она должна уметь обращаться к двум разным сервисам, каждый из которых выбирается флагом --service.

#### CLI

```ruby
exe/weather weather --service Metaweather London # => "Heavy Cloud, 18.28"
exe/weather weather -s Fake Miami # => "Beautiful weather"
```

#### API

```ruby
Oop::Workshop.weather('Metaweather', 'London') # => "Heavy Cloud, 18.28"
```

- or -

```ruby
w = Oop::Workshop.Weather.init('Metaweather')
w.weather 'London' # => "Heavy Cloud, 18.28"
w.weather('Miami', 'Fake') # => "Beautiful weather"
```
