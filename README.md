Qiang Apps
==========

Qiang's apps. As a geek:-)

# Information

- Hosted on [Heroku](http://qiang-apps.herokuapp.com)
- Powered by [Ruby on Rails](http://rubyonrails.org)

# Installation

```ruby
heroku config:set ABOUT_ME=[...]
heroku config:set EMAIL=[...]
heroku config:set MANDRILL_USERNAME=[...]
heroku config:set MANDRILL_API_KEY=[...]
heroku run rake db:migrate db:seed_fu
heroku run rails console
Admin.create!({ :email => '...', :password => '...', :password_confirmation => '...' })
```

# License

[MIT](http://opensource.org/licenses/MIT)
