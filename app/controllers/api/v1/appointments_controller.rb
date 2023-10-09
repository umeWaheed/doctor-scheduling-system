# frozen_string_literal: true

class Api::V1::AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[show update destroy]
  before_action :set_doctor, only: %i[index create]

  # GET /doctors/:doctor_id/appointments
  def index
    @appointments = @doctor.appointments
    render json: @appointments
  end

  # POST /doctors/:doctor_id/appointments
  def create
    @appointment = @doctor.appointments.create!(permitted_params)
    render json: @appointment
  end

  # GET /appointment/:id
  def show
    render json: @appointment
  end

  # PUT /appointments/:id
  def update
    @appointment.update!(permitted_params)
    render json: @appointment
  end

  # DELETE /appointments/:id
  def destroy
    @appointment.destroy
    render json: @appointment
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def permitted_params
    params.require(:appointment).permit(:slot_id, :patient_name)
  end
end
