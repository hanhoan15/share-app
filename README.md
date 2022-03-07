# README

This is a super small webapp using rails, ruby, sqlite.

Additional information:
* ruby 2.6.0
* rails 6.1.4.1

Install postgre
* https://postgresapp.com/
* Open postgre cli
* `rake db:create`
* `rake db:migrate`

Install
* `cd/share-app`
* `bundle install`
* `bin/rails server`

Unit test
* `rspec spec/controllers/home_controller_spec.rb`
* `rspec spec/controllers/share_controller_spec.rb`
* `spec/controllers/vote_controller_spec.rb`

* `rspec /spec/models/article_spec.rb`
* `rspec spec/models/user_spec.rb`
* `spec/serializer/article_serializer_spec.rb` 