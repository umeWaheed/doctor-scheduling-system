FactoryBot.define do
  factory :availability do
    association :doctor

    date { Date.today }
    start_time { '04:00'.to_time.utc }
    end_time { '09:00'.to_time.utc }
    duration { 30 }
  end
end
