# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :patient_name, null: false, default: ''
      t.belongs_to :slot, foreign_key: { on_delete: :cascade }
      t.belongs_to :doctor, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
