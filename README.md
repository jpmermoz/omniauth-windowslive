# OmniAuth Windows Live

This gem contains the unofficial WindowsLive strategy for OmniAuth.

## Basic Usage

First, you must use Devise and in your rails app.
Then, put the following gems in your Gemfile:
  
  $ gem 'omniauth'
  $ gem 'omniauth-windowslive', git: 'git://github.com/jpmermoz/omniauth-windowslive.git'

Go to initializers/devise.rb and add the following line:

```ruby
require "omniauth-windowslive"
config.omniauth :windowslive, "APPID", "APPSECRET", { :scope => "wl.basic" }
```

(Other valid scopes are: "wl.imap", "wl.emails", etc)

## Ruby

Tested with the following Ruby versions:

- RUBY 1.9.3-p0
- RUBY 2.0.0