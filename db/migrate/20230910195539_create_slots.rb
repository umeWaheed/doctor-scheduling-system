# frozen_string_literal: true

class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :status, null: false, default: 0
      t.belongs_to :availability, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
