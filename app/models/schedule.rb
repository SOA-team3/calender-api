# frozen_string_literal: true

require 'json'
require 'sequel'

module No2Date
  # Models a secret document
  class Schedule < Sequel::Model
    many_to_one :meeting

    plugin :timestamps

    # rubocop:disable Metrics/MethodLength
    def to_json(options = {})
      JSON(
        {
          data: {
            type: 'schedule',
            attributes: {
              id:,
              title:,
              description:,
              location:,
              start_date:,
              start_datetime:,
              end_date:,
              end_datetime:,
              organizer:,
              attendees:
            }
          },
          included: {
            meeting:
          }
        }, options
      )
    end
    # rubocop:enable Metrics/MethodLength
  end
end