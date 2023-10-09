# frozen_string_literal: true

class Availability < ApplicationRecord
  include TimeValidatable

  has_many :slots, dependent: :destroy
  belongs_to :doctor

  enum day: {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  validates :date, :start_time, :end_time, :duration, presence: true
  validates :duration, numericality: { greater_than: 0, less_than_or_equal_to: 60 }

  before_save :set_day
  after_create :generate_slots

  private

  def set_day
    self.day = date.wday
  end

  def generate_slots
    SlotsGenerator.new(id).execute
  end
end
