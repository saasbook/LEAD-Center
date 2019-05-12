# LEAD-Center &middot; [![Build Status](https://travis-ci.org/eilenshahbaz/LEAD-Center.svg?branch=master)](https://travis-ci.org/eilenshahbaz/LEAD-Center) &middot; [![Maintainability](https://api.codeclimate.com/v1/badges/d515c519cc725088b09a/maintainability)](https://codeclimate.com/github/eilenshahbaz/LEAD-Center/maintainability) &middot; [![Test Coverage](https://api.codeclimate.com/v1/badges/d515c519cc725088b09a/test_coverage)](https://codeclimate.com/github/eilenshahbaz/LEAD-Center/test_coverage)

## Production
Project Deployed on [Heroku](https://communities-cal.herokuapp.com/)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration
Regarding Symmetric Key: it should be provided by the course staff

To ecnrypt the API key run: `gpg --output config/application.yml.asc --symmetric config/application.yml`

To decrypt the API key run: `gpg --output config/application.yml --decrypt config/application.yml.asc`



Interests must be supplied in a .csv file of two columns. The header (first row) must have the titles "Organization ID" and "Organization Interest".

The file should be named "interests.csv" and placed at `/lib/interests.csv/`. 

Interests may also be uploaded at the relative path `/interests`, which requires http basic auth. The username is "admin" and the password may be found in the `config/application.yml` file.



The quiz questions are currently manually inputted through a seed file. These questions should have interests and categories that match exactly with those of the database. As of writing (May 2019), it currently does not, resulting in some matches that shouldn't be happening.

Quiz questions are to be provided by the LEAD center.

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

