# LEAD-Center &middot; [![Build Status](https://travis-ci.org/eilenshahbaz/LEAD-Center.svg?branch=master)](https://travis-ci.org/eilenshahbaz/LEAD-Center) &middot; [![Maintainability](https://api.codeclimate.com/v1/badges/d515c519cc725088b09a/maintainability)](https://codeclimate.com/github/eilenshahbaz/LEAD-Center/maintainability) &middot; [![Test Coverage](https://api.codeclimate.com/v1/badges/d515c519cc725088b09a/test_coverage)](https://codeclimate.com/github/eilenshahbaz/LEAD-Center/test_coverage)

## Production
Project Deployed on [Heroku](https://communities-cal.herokuapp.com/)

## System dependencies:
Ruby version 2.5.3

Rails version 5.2.2

Our service depends on the CalLink Engage API, the documentation of which can be found [here.](https://callink.berkeley.edu/api/docs/#introduction) This service requires an API key, more details can be found in the Configuration section.

## Important notes:
Currently, both the CalLink API key and the Calnet login authorizations are tied to the Spring 2019 CS169 team's personal accounts. Please attempt to migrate to your own as soon as possible.

Note that our current API key is considered a development key and can be used from any IP address. 

We have sensitive data that should be handled according to [this guide.](http://saasbook.github.io/courseware/devops/managing-api-keys.html)

## Configuration

Important secret keys are contained inside the config/application.yml.asc file. The decrypted version is not stored on github for security purposes. Each time you update this file you must re-encrypt, and have everyone also re-decrypt. 

TravisCI already has access to the symmetric key, so it can decrypt the file for tests.

Regarding Symmetric Key: it should be provided by the course staff

To encrypt the API key run: `gpg --output config/application.yml.asc --symmetric config/application.yml`

To decrypt the API key run: `gpg --output config/application.yml --decrypt config/application.yml.asc`



Interests are not contained in the CalLink database API, and therefore must be supplied in a .csv file. 

This file should have two columns. The header (first row) must have the titles "Organization ID" and "Organization Interest". The “Organization Interest” column should be a string of interest separated by commas. The file should be named "interests.csv" and placed at `/lib/interests.csv/`. 

Interests may also be uploaded at the relative path `/interests`, which requires http basic auth. The username is "admin" and the password may be found in the `config/application.yml` file.

Interest rspec tests requires mock files to be in the `spec/response` directory. They are currently named ‘raw_organizations_response_page1.txt’, ‘raw_organizations_response_page1.txt’, and ‘fake_interest.csv’. They have the same format as the CalLink API and the ‘interest.csv’ file.

The quiz questions are currently manually inputted through a seed file. These questions should have interests and categories that match exactly with those of the database. As of writing (May 2019), it currently does not, resulting in some matches that shouldn't be happening.

Quiz questions are to be provided by the LEAD center.

## Database Initialization

`rake db:create`

## How to run the test suite

We just use rspec and cucumber. You may run all tests with just ``rake``, just rspec with ``bundle exec rspec`` or just cucumber with ``rake cucumber``.

## Future improvements:

Heroku hosting uses a range of IP addresses, which would not be compatible with the production key's IP whitelist requirement. The LEAD center expects that eventually we transition somehow to a static IP address, but this has not been accomplished. Current most promising lead is to host the website at Open Computing Facility here at UC Berkeley. Other potential solutions are to use a 3rd party Heroku plugin, or to proxy through a static ip address.

An admin portal is desired so that the LEAD center may edit the quiz without interfacing with the database on a low level. This page should also provide a better interface for uploading interests csvs.

Currently data retrieval from the CalLink API is very slow. There doesn't seem to be a way to solve this immediately, as data cannot be cached as they will risk being outdated. Perhaps work with CalLink for faster speeds.

If time permits, further functionality such as organization portals and event planners can be implemented.

## Deployment instructions

The current app is already deployed to [Heroku](https://communities-cal.herokuapp.com). However, if you wish to deploy your own version of this app to your own Heroku account, you can can easily deploy using `git` by following [this guide](https://devcenter.heroku.com/articles/git). 

### Deploying Local Changes
If you want to deploy to Heroku from your command line, you *must* have the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install) installed on your machine. When deploying any local changes from your `master` branch to the production version on Heroku, you can run `git push heroku master` from your command line. 

### Heroku Environment Variables
Figaro allows you to easily configure the environment variables from `config/application.yml` to production by running `figaro heroku:set -e production -a communities-cal`, where `communities-cal` is the name of _your_ Heroku app. *Important: * this must be done anytime the contents of the `config/application.yml` file changes.

Worth noting that auth.berkeley.edu authentication is currently registered for the domain “https://communities-cal.herokuapp.com". Since currently it is tied to an old team member's account, you may need to re-request authentication to change this.


