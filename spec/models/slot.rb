require 'rails_helper'

RSpec.describe Slot, type: :model do
  before(:all) do
    @slot = create(:slot, :available)
  end

  it "has start_time < end_time" do
    expect(@slot).to be_valid
  end

  it "has start_time > end_time" do
    @slot.start_time = "11:00".to_time
    expect(@slot).to_not be_valid
  end

  it "has valid status" do
    expect(@slot).to be_valid
  end
end
