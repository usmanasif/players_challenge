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

## Your Tasks:

 * Create models and migrations for `Players`, `Devices`, `Offers`, and `OfferTargets`
   - `Players` have the following attributes
     * has one `Device`
     * first name
     * last name
     * birthdate
       - no one 13 or younger is allowed
     * gender
       - `'male'`, `'female'`, `'non-binary'`
   - `Devices`
     * belongs to a single `Player`
     * model name
     * operating system
       - can be either `'ios'` or `'android'`
     * os version
       - Semantic Versioning aka SemVer
     * locale
       - five digit ISO code like `'fr_CA'` for French Canada and `'en_US'` for US English
   - `Offers`
     * has many `OfferTargets`
     * title
     * header
     * description
     * points
       - integer
     * payout
       - monetary (USD)
   - `OfferTargets`
     * has one `Offer`
     * minimum age `[ Player ]`
     * maximum age `[ Player ]`
     * gender `[ Player ]`
     * operating system `[ Device ]`
     * minimum os version `[ Device ]`
     * locale `[ Device ]`
 * Create a web page or pages which allow us to add, edit, list and delete data for each of the above models
   - keep it simple
 * Create a feature which allows us to select an existing `OfferTarget` and display which `Players` match the target conditions
   - for example: select `OfferTarget: ['18-24', 'female', 'ios', '5.0', 'en_US']` and see a list of players who match
 * Create a feature in which you can select or enter a range of `Device.os_version` and display the count of matching `Devices`
   - for example: enter `5.4.0 - 10.0.1` and see `"6 matching devices"`
 * Create a feature in which you can select or enter an age range and display the total `Offer` payout for existing `Players`
   - for example: enter `'18 - 24'` and see `$123.45` 
 * Create some test data to seed the database. Use `Faker` or whichever method you prefer
 * Please include some basic tests / specs. Use whichever test framework you prefer (RSpec or MiniTest or ?)
 * Update this README file with information on how to setup and run your project solution

### Notes:
  * For the views feel free to use any web development framework you are familiar with and feel comfortable using
  * The existing codebase has nothing added to it beyond initial project setup
  * If the project is taking too long then you may leave something out. Be sure to let us know so we can adjust the requirements
  
## Project Submission:
Please provide us with a github repository fork of this project or a pull request
