# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :slot, required: true
  belongs_to :doctor, required: true

  validates :patient_name, presence: true

  before_save :verify_slot_owner, :check_slot_availability
  after_save :book_slot
  before_update -> { reset_slot(true) }, if: :will_save_change_to_slot_id?
  before_destroy :reset_slot

  private

  def verify_slot_owner
    return if doctor.slot_ids.include? slot.id

    errors.add(:slot, 'does not belong to the selected doctor')
  end

  def check_slot_availability
    return if slot.available?

    errors.add(:slot, 'is already booked')
  end

  def reset_slot(update_prev = false)
    prev_slot =  update_prev ? Slot.find(slot_id_was) : slot
    prev_slot.update(status: 0)
  end

  def book_slot
    slot.update(status: 1)
  end
end
