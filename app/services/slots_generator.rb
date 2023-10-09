# frozen_string_literal: true

class SlotsGenerator
  attr_accessor :availability

  def initialize(id)
    @availability = Availability.find(id)
  end

  def execute
    duration = @availability.duration.minutes
    slot_start = to_utc_time(@availability.start_time)
    slot_end = slot_start + duration

    while slot_end < to_utc_time(@availability.end_time)
      @availability.slots.create(start_time: slot_start, end_time: slot_end)
      slot_start = slot_end
      slot_end = slot_start + duration
    end
  end

  private

  def to_utc_time(time)
    time.to_time.utc
  end
end
