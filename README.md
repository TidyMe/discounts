# Discounts

This project rocks and uses MIT-LICENSE.

In Gemfile

```ruby
gem 'discounts', git: 'git@github.com:pjsim/discounts.git'
```

And then:
```
$ bundle install
$ rake discounts:install:migrations
$ rake db:migrate
```

In config/routes
```ruby
mount Discounts::Engine, at: "/discounts"
```
