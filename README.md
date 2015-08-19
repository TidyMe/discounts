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

In app/controllers/application\_controller.rb
```ruby
helper Discounts::Engine.helpers
```
