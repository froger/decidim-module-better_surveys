# Decidim Better Surveys

Decidim Surveys are greats, and we need some new features. This modules aims to test two new features in 
Decidim Surveys: 

1. Fullscreen
As an administrator, I can share a different URL for the surveys, allowing it to remove clutter. 
When the form does not need user registration, we completly remove navigation, and have the form in plain screen. 
Only a go back button will allow user to go back to an URL defined by the administrator. 

2. Form Statistics
We add a HomePage component for statistics of submission for some forms. We can then define: 
- A title for the statistic block
- A CSV list of survey's ID to keep counting. 

The statistics will also appear sistematically on fullscreen forms. 


## Why it is not on Metadecidim? 

We prefer to test functionality, proving their are valuable before adding "stuff" in the decidim core. 
This module might result on a MetaDecidim proposal after 6months/1year of trial/error. 

## Install the module
Add the gem to your Gemfile
```ruby
gem "decidim-better_surveys"
```

Run bundle
```bash
bundle install
```


# Run locally
To run this module locally, we use Docker-compose:

```bash
docker-compose up
```
This will run a decidim-better_surveys container, which **sleeps and does nothing**.

After your containers are mounted, you can seed the database: 
```bash
  docker-compose exec -it decidim-better_surveys bin/rails db:seed
```

Then, you can start the server
```bash
  docker-compose exec -it decidim-better_surveys bin/rails s -b 0.0.0.0
```

You can then open a bash session and edit the initializer, as described in the "How to add a custom user field" section. 
```bash
  docker-compose exec -it decidim-better_surveys bash
```

Once something change in your `./lib`, restart your server: 
```bash
  docker-compose exec -it decidim-better_surveys bin/rails restart
```

While developing locally, you have two environment variables that can help you:

* `ROOT`: the root of the application using the module
* `MODULE_ROOT`: the place where your gem code is.

### Usefull commands

| Command                                                                                          | Description                                         |
|--------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| `docker-compose exec -it decidim-better_surveys bundle exec rails db:seed`                          | Seed the database (run on localhost:3000)           |
| `docker-compose exec -it decidim-better_surveys bin/webpack-dev-server`                             | Compile assets and watch for changes                |
| `docker-compose exec -it decidim-better_surveys bin/rails s -b 0.0.0.0`                             | Run the Rails server in development                 |
| `docker-compose exec -it decidim-better_surveys bundle exec rspec /home/decidim/module/spec`        | Run tests for the module                            |
| `docker-compose exec -it decidim-better_surveys bundle exec rubocop -a /home/decidim/module`        | Correct lint errors with RuboCop                    |
| `docker-compose exec -it decidim-better_surveys bash`                                               | Navigate your container in bash                     |