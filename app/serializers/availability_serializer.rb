# frozen_string_literal: true

class AvailabilitySerializer < ActiveModel::Serializer
  attributes :id, :doctor_id, :doctor_name, :day, :date, :duration, :start_time, :end_time

  def doctor_name
    object.doctor.name
  end
end
