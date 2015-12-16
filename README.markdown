# Theblog - Default blogging engine for most purposes

[![Build Status](https://travis-ci.org/kont-noor/Theblog.svg?branch=master)](https://travis-ci.org/kont-noor/Theblog)
[![Gem Version](https://badge.fury.io/rb/theblog.svg)](https://badge.fury.io/rb/theblog)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/kont-noor/theblog/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

## Usage

To install the blog engine add the following line to `Gemfile`

```ruby
  gem 'theblog'
```

Then mount your application at `config/routes.rb`

```ruby
  mount Theblog::Engine, at: "/blog"
  mount Incarnator::Engine, at: "/auth"
```

And run `rake db:migrate`

For now user registration is not implemented so create the confirmed user in the rails console

```ruby
  Incarnator::Account.create email: 'fake@mail.com', user_name: 'username', password: 'password',
                      confirmed_at: Time.now
```

Follow `/blog/admin` to access the admin dashboard and `/blog` to get blog frontend.
