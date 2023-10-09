# frozen_string_literal: true

class Doctor < ApplicationRecord
  has_many :availabilities, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :slots, through: :availabilities

  validates :name, presence: true
end
