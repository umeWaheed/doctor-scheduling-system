require 'rails_helper'

RSpec.describe Appointment, type: :model do
  before(:all) do
    @appointment = create(:appointment)
    @new_slot = create(:slot, :available_slot)
    @booked_slot = create(:slot, :booked_slot)
  end

  it "is valid with name" do
    expect(@appointment).to be_valid
  end

  it "is invalid without patient name" do
    @appointment.patient_name = ''
    expect(@appointment).to_not be_valid
  end

  it "cannot book already booked slot" do
    @appointment.update(patient_name: 'Atif', slot_id: @booked_slot.id)
    expect(@appointment.errors).to_not be_empty
  end

  it "should change slot status after creation" do
    expect(@appointment.slot.status).to eq("booked")
  end

  it "should update previous and current slot status after slot id is changed" do
    previous_slot = @appointment.slot
    @appointment.update(slot_id: @new_slot.id)
    expect(previous_slot.reload.status).to eq("available")
    expect(@appointment.slot.status).to eq("booked")
  end

  it "should reset slot status after appointment is deleted" do
    current_slot = @appointment.slot
    expect(current_slot.status).to eq('booked')
    @appointment.destroy
    expect(current_slot.status).to eq('available')
  end
end
