# frozen_string_literal: true
class Api::V1::SlotsController < ApplicationController

  # GET /doctors/:doctor_id/slots
  def index
    @doctor = Doctor.find(params[:doctor_id])
    slots = @doctor.slots
    render json: permitted_params[:status].present? ? slots.send(permitted_params[:status]) : slots
  end

  private

  def permitted_params
    params.permit(:status)
  end
end
