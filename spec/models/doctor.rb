require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before(:all) do
    @doctor = create(:doctor)
  end

  it "is valid with name" do
    expect(@doctor).to be_valid
  end

  it "is invalid without name" do
    @doctor.name = ''
    expect(@doctor).to_not be_valid
  end
end
