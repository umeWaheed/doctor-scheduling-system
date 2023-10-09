# frozen_string_literal: true

class SlotSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :status
end
