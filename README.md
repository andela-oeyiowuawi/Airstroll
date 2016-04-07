#AIRSTROLL
[![Coverage Status](https://coveralls.io/repos/github/andela-oeyiowuawi/Airstroll/badge.svg?branch=master)](https://coveralls.io/github/andela-oeyiowuawi/Airstroll?branch=master)
[![Circle CI](https://circleci.com/gh/andela-oeyiowuawi/Airstroll.svg?style=svg)](https://circleci.com/gh/andela-oeyiowuawi/Airstroll)
Airstroll is a flight booking and management app that can be used to search for flights, book reservations and manage those reservations.

##Getting Started

* Clone the application with ```git clone git https://github.com/andela-oeyiowuawi/Airstroll.git```

##Dependencies

* Ruby version 2.2.1 and above
* rails 4.2.2

Once you have those two, you can then run your command line and navigate into the project's folder and then run:

* Run ```bundle``` to install all other dependencies
* Run ```rake db:migrate```
* Run ```rake db:seed ```

You can then run ```rails s``` and visit the page on the browser by typing ```localhost:3000```

##Running The Specs
After all the setting up as mentioned above, you can run the tests. The tests are driven by rspec, capybara and selenium. You can get them fired up by running the following command from the terminal.

rspec spec

or

bundle exec rspec

##Application Features

* Flight search.
* Flight booking.
* Booking cancellation before flight date.
* Viewing past booking.
* Booking management.
* Email notification.

##Limitations

The application is unable to process payments yet.

##Live Demonstration

View [App on heroku](https://airstroll.herokuapp.com/)

##Contributions

Bug reports and pull requests are welcome on GitHub at https://github.com/andela-oeyiowuawi/Airstroll.

* Fork it ( https://github.com/andela-oeyiowuawi/Airstroll/fork)
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Add some feature')
* Push to the branch (git push origin my-new-feature)
* Create a new Pull Request
