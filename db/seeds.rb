# creates doctor records with sample data
# generates slots and set some of them as booked
# generates some dummy appointments as well

doctor1 = Doctor.find_or_create_by(name: 'Aatif')
doctor2 = Doctor.find_or_create_by(name: 'John')

# create random availabilities for the doctors
# doctor 1 is available for 5 consecutive days a week, like if today is Tuesday then Availability will be from Wed-Sun
# doctor 2 is available for 2 days a week, like if today is Tuesday then Availability will be from Wed-Thu

7.times do |index|
  if index > 0 && index < 6
    doctor1.availabilities.create(date: Date.today + index, start_time: '05:00'.to_time.utc, end_time: '09:00'.to_time.utc + index.hours, duration: 30)
  end
  if index > 4
    doctor2.availabilities.create(date: Date.today + index, start_time: '04:00'.to_time.utc, end_time: '08:00'.to_time.utc, duration: 45)
  end
end

# create appointments
Appointment.create(slot: Slot.first, patient_name: 'Dexter', doctor_id: doctor1.id)
Appointment.create(slot: Slot.second, patient_name: 'William', doctor_id: doctor1.id)
