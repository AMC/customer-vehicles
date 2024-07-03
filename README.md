# Overview

Code exercise instructions - Outdoor.sy Customer List

We’d like you to code a small tool for a fictional company called Outdoor.sy that takes some of their
customer lists and returns the data in different sorted orders.

We expect a very rudimentary app and you can choose which technologies to use. You can build this in a
back-end language (we do love Ruby) and call it from the command line, or you can build it all in
javascript and load the lists in memory and display them on a web page, or you can build a small full-
stack app that has both, etc. 

We recommend you pick technologies that you're comfortable with so you can focus on demonstrating what 
you know. 

We expect folks to build something in one or two short sittings and don’t want to take up a substantial 
amount of your time.

You should be able to run this app on your computer and post the work to github or email us the code.

Please include a readme so we know how to run it. You can have the app afterwards - the code is yours,
so feel free to use it as part of your portfolio, etc.

Input data:
Each file has a list of data with the following fields: First name, Last name, Email, Vehicle type, Vehicle
name, and Vehicle length. 

The data will be separated by a pipe or a comma and the data fields themselves don’t contain those separators.

Here’s what we want the tool to do:
1. Add data from an upload file (ie: an argument in command line or file input)
2. Display the information Outdoor.sy wants to see about their customers: Full name, Email,
   Vehicle type, Vehicle name, Vehicle length
3. Sort the data by Vehicle type or by Full name
   You can decide how to present the data based on the tech stack that you choose, but get as far as you
   can with those features and if you think of other enhancements you’d like to do along the way - that’s
   great, too! This is meant to allow you to demonstrate strengths that you’d like to highlight. Please keep
   code structure, naming, and testability in mind - we’re more interested in code patterns and code design
   than any specific features. And if you have any questions, please feel free to email anytime - that is part
   of the process in the real world!

# Setup
This project uses sqlite3 as the database. To install sqlite3, run the following command:
```
brew install sqlite3
```

To install the required gems, run the following command:
```
bundle install
```

To create the database and tables, run the following command:
```
bundle exec rails db:prepare
```

To run the application, run the following command:
```
bundle exec rails s
```

To run the tests, run the following command:
```
bundle exec rspec
```


# Usage
The application has a web interface that allows users to upload a file containing customer data. The file 
should be a CSV file with the following columns: First name, Last name, Email, Vehicle type, Vehicle name, 
and Vehicle length. The data should be separated by a comma or a pipe.

After uploading the file, the application will display the customer data in a table. The user can sort the
data by clicking on the column headers.

To reset the data, click on the "Delete All" button.


# Notes

This app is overengineered for the requirements but demonstrate design patterns and best practices.

It utilizes the following gems:
- `interactors` - for organizing business logic
- `draper` - for decorating models

The interactors could easily be simplified into a single service, but are used to demonstrate an approach
to a more complex application.
