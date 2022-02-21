### Challenge project
##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.0](https://github.com/usmanasif/challenge_project/blob/main/.ruby-version#L1)
- Rails [7.0.2.2](https://github.com/usmanasif/challenge_project/blob/main/Gemfile#L12)

##### 1. Check out the repository

```bash
git clone https://github.com/usmanasif/challenge_project.git
```

##### 3. Bubdle

Run the following command to install dependencies.

```ruby
bundle install
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000
