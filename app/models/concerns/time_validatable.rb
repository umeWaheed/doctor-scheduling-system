# frozen_string_literal: true

module TimeValidatable
  extend ActiveSupport::Concern

  included do
    validate :validate_timings

    def start_time
      self[:start_time].strftime('%H:%M')
    end

    def end_time
      self[:end_time].strftime('%H:%M')
    end

    private

    def validate_timings
      return if start_time < end_time

      errors.add(:end_time, 'must be after start time')
    end
  end
end
