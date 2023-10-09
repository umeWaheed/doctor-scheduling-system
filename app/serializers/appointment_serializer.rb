# frozen_string_literal: true

class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :patient_name, :slot_id, :start_time, :end_time, :doctor_id, :doctor_name

  def start_time
    object.slot.start_time
  end

  def end_time
    object.slot.end_time
  end

  def doctor_name
    object.doctor.name
  end
end
