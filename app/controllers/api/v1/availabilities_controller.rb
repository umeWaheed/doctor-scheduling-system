# frozen_string_literal: true

class Api::V1::AvailabilitiesController < ApplicationController
  before_action :set_doctor

  # GET /doctors/:doctor_id/availabilities
  def index
    render json: @doctor.availabilities
  end

  # POST /doctors/:doctor_id/availabilities
  def create
    @availability = @doctor.availabilities.create!(permitted_params)
    render json: @availability
  end

  # DELETE /doctors/:doctor_id/availabilities/:id
  def destroy
    @availability = @doctor.availabilities.find(params[:id])
    @availability.destroy
    render json: @availability
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def permitted_params
    params.require(:availability).permit(:start_time, :end_time, :duration, :date)
  end
end
