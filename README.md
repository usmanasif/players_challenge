# README

In this project you'll be using Ruby on Rails with Postgres to create a simple web UI to display data from a database.

This site is an internal tool which helps us find which `Players` should get which `Offers` based on their `OfferTargets`.

## Prerequisities
  - Ruby 3.1 installed
  - Postgres installed
    * http://postgresapp.com/
    * http://postgresapp.com/documentation/configuration-general.html

## Setup

* Install gems

  ``bundle install``

* Create the database
  1. Run `psql` in Terminal or `Open psql` from the Postgres.app status menu.
  2. `\du`
  2. `CREATE USER challenge_project;`
  3. `CREATE DATABASE "challenge_project_development" WITH OWNER challenge_project;`
  4. `\q`

* Run the Rails server

  ``rails s``
  