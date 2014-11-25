Qiang Apps
==========

Qiang's apps. As a geek:-)

# Information

- Hosted on [Heroku](http://qiang-apps.herokuapp.com)
- Powered by [Ruby on Rails](http://rubyonrails.org)

# Installation

```ruby
heroku config:add ABOUT_ME=[...]
heroku config:add EMAIL=[...]
heroku config:add MAILER_USER_NAME=[...]
heroku config:add MAILER_PASSWORD=[...]
heroku run rake db:migrate db:seed_fu
heroku run rails console
Admin.create!({ :email => '...', :password => '...', :password_confirmation => '...' })
```

# License

[MIT](http://opensource.org/licenses/MIT)
