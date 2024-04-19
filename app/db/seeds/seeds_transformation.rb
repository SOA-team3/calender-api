require 'json'
require 'yaml'

json_data = '{"type":"event","id":"XcqOOSSR3S","title":"Meeting with Client","description":"Discuss project requirements and timelines.","location":"123 Main Street, Cityville","start_date":"2024-05-01","start_datetime":"2024-05-01T09:00:00","end_date":"2024-05-01","end_datetime":null,"organizer":"John Doe","attendees":["Jane Smith","Mike Johnson"]}'

# json to yaml
parsed_data = JSON.parse(json_data)
yaml_data = parsed_data.to_yaml
puts yaml_data

# yaml to json
yaml_data_path = 'app/db/seeds/event_seeds.yml'
parsed_data = YAML.load_file(yaml_data_path)
json_data = parsed_data.to_json
puts json_data
