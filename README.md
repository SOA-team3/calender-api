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

##  Simple file-based POST / GET Usage

### Create an event
After running puma, open up a new local terminal and check up your local endpoint address. e.g. http://0.0.0.0:9292
Run the POST message with new information and your local endpoint address.
```shell
curl -X POST -H "Content-Type: application/json" -d '{
  "title": "Discussion for SEC project",
  "location": "TSMC building, NTHU",
  "start_date": "2024-04-19",
  "start_datetime": "2024-04-19T09:00:00",
  "end_date": "2024-04-19",
  "end_datetime": "2024-04-19T10:00:00",
  "organizer": "Brian",
  "attendees": ["Adrian", "Ella"]
}' http://0.0.0.0:9292/api/v1/calendars
```
The id will be generated automatically by time-stamp and hashing.
The empty colomns will be noted as null.

The response message would be:
```shell
{
    "message": "Calendar saved",
    "id": "Hashed(time-stamp) of the created event"
}
```
### Get an event
Retrieve the details of a specific event by its id.
Run the GET message with the specific id and your local endpoint address.
```shell
curl -X GET http://0.0.0.0:9292/api/v1/calendars/XcqOOSSR3S
# or
curl http://0.0.0.0:9292/api/v1/calendars/XcqOOSSR3S
```
Or we can enter the GET message on browser's address bar (URL bar).
```shell
http://localhost:9292/api/v1/calendars/XcqOOSSR3S
```

The response message would be (for example):
```shell
{
    "type":"event",
    "id":"XcqOOSSR3S",
    "title":"Meeting with Client",
    "description":"Discuss project requirements and timelines.",
    "location":"123 Main Street, Cityville",
    "start_date":"2024-05-01",
    "start_datetime":"2024-05-01T09:00:00",
    "end_date":"2024-05-01",
    "end_datetime":null,"organizer":"John Doe",
    "attendees":
        ["Jane Smith","Mike Johnson"]
}
```

### Listing all events
Retrieve all events' ids.
Run the GET message with your local endpoint address.
```shell
curl -X GET http://0.0.0.0:9292/api/v1/calendars
# or
curl http://0.0.0.0:9292/api/v1/calendars
```
Or we can enter the GET message on browser's address bar (URL bar).
```shell
http://localhost:9292/api/v1/calendars
```

The response message would be a list of event_ids:
```shell
{
  "event_ids": [
    "KDIVnk5YRF",
    "XcqOOSSR3S"
  ]
}
```