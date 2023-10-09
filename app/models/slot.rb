# frozen_string_literal: true

class Slot < ApplicationRecord
  include TimeValidatable

  has_one :appointment

  enum status: {
    available: 0,
    booked: 1
  }
end
