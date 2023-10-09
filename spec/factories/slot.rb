FactoryBot.define do
  factory :slot do
    trait :available_slot do
      start_time { '04:00'.to_time.utc }
      end_time { '09:00'.to_time.utc }
      status { 'available' }
    end

    trait :booked_slot do
      start_time { '04:00'.to_time.utc }
      end_time { '09:00'.to_time.utc }
      status { 'booked' }
    end
  end
end
