# frozen_string_literal: true

class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    create_table :availabilities do |t|
      t.integer :day, null: false, default: 0
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :duration, null: false, default: 60
      t.belongs_to :doctor, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
