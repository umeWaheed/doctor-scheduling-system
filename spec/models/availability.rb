require 'rails_helper'

RSpec.describe Availability, type: :model do
  before(:all) do
    @availability = create(:availability)
  end

  it 'is valid with accurate data' do
    expect(@availability).to be_valid
  end

  it 'is invalid with duration < 0 or duration > 60' do
    @availability.duration = -1
    expect(@availability).to_not be_valid
    @availability.duration = 90
    expect(@availability).to_not be_valid
  end

  it 'sets day after creation' do
    expect(@availability.day).to eq(Date.today.strftime('%A').downcase)
  end

  it 'generates slots after creation' do
    expect(@availability.slots).to_not be_empty
  end
end
