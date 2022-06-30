# Welcome to the Rhode Island Septic API

Description:
The RI Septic API is designed to track and help design septic systems in the state of Rhode Island.
For API/V1 we are only following the guidlines for a class 1 designer. Which means the following.
* bedrooms are counted at 115 gallons per day
* only "Demand Dosing" is factored in
* only the following technolgies are accounted for
  * Pipe and stone
  * Eljin Indrains
  * Shallow concrete chambers (pending)
  * GST


Things you may want to cover:

* Ruby version
  * 2.7.2


* Database creation
  * PostgreSQL
  * Run `rails db:create` to create the database
  * Run `rails db:migrate` to run the migrations and setup the tables
  * Run `rails db:seed` to seed the database, this will only seed the Tech table with appropriate information

* How to run the test suite
  * the current testing is run in RSPEC
  * to run the tests, in the terminal run `bundle exec rspec`
    * this will run the entire testing suite
  * if you wish to run a specific test file
    * run `bundle exec rspec spec/the file you want to run`

## Available Endpoints
* GET `/api/v1/contractors`
  * returns a list of all registered contractors and their basic contact information
* POST `api/v1/contractors` 
