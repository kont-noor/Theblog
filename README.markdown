# Theblog - Default blogging engine for most purposes

[![Build Status](https://travis-ci.org/kont-noor/Theblog.svg?branch=master)](https://travis-ci.org/kont-noor/Theblog)
[![Gem Version](https://badge.fury.io/rb/theblog.svg)](https://badge.fury.io/rb/theblog)

## Usage

To install the blog engine add the following line to `Gemfile`

```ruby
  gem 'theblog'
```

if you use Rails < 4.2 add foreigner as well:

```ruby
  fem 'foreigner'
```

Then run the following commang in the console:

```
  rails generate theblog:install
```

And run `rake db:migrate` and then `rake db:seed`

To add admin account run the following rake task:

```
  rake app:theblog:create_account[admin,admin@theblog.com,password]
```

Launch your application:

```
  rails server
```

Follow `/blog/admin` to access the admin dashboard and `/blog` to get blog frontend.

## Override views

To override views run the following task:

```
  rails generate theblog:views
```

## Override controllers

Now you can override controllers. Just follow steps provided [here](http://edgeguides.rubyonrails.org/engines.html#implementing-decorator-pattern-using-class-class-eval)
