# Blue Jays Listings

We are Vincent Chan and Tony Lum, and this is Blue Jays Listings! Blue Jay Listings is a command line interface data extrapolating App. Users can retrieve information from our database regarding real estate listings for sale; finding listings information including, but not limited to: highest priced listings, listings by a zip code and all listings they choose to save. Currently our app is using the Faker gem to seed all the data for our listings database; but it can potentially be connected to a live database of real estate listing.

## Getting Started

Please follow the instructions below to get our App running properly.

### Installing

1. After cloning and forking the repository from github, please install all the necessary gems files with the command "bundle install"
2. Afterwards, please run "rake db:migrate" to create the necessary tables for the database.
3. Run "rake db:seed" to seed all the data into your database.
4. to run the App, enter "ruby bin.run.rb" when you are in the root directory of the App file.


### Built with

1. Sqlite3 Database
2. sinatra - ActiveRecord
3. Faker gem
4. Pry
5. Require_all

### Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.



### Authors
Tony Lum

Vincent Chan



### Acknowledgements:
- Thanks for trying out our code!
