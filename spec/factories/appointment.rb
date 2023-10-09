FactoryBot.define do
  factory :appointment do
    association :slot, :available_slot
    association :doctor

    patient_name { 'M. Ali' }
  end
end
