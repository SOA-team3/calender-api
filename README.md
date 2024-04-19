# calendar API

API to store and retrieve confidential development files (configuration, credentials)

## Vulnerabilites
https://docs.google.com/document/d/1_DufdMLVxXIdT0sk0V0GbFlayJkandcalPLfxe_eugo/edit?usp=drive_link 

## Routes

All routes return Json

- GET `/`: Root route shows if Web API is running
- GET `api/v1/calendars/`: returns all confiugration IDs
- GET `api/v1/calendars/[ID]`: returns details about a single calendars with given ID
- POST `api/v1/calendars/`: creates a new calendars

## google-apis-calendar_v3
- ref: https://rubygems.org/gems/google-apis-calendar_v3/versions/0.5.0?locale=zh-TW
- gem install google-apis-calendar_v3 -v 0.5.0

## Install

Install this API by cloning the *relevant branch* and installing required gems from `Gemfile.lock`:

```shell
bundle install
```

## Test

Run the test script:

```shell
ruby spec/api_spec.rb
```

## Execute

Run this API using:

```shell
puma
```
=======
