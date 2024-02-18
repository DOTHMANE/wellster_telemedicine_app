class DoctorsController < ApplicationController
  before_action :set_doctor
  before_action :set_patient, only: %i[assign_patient]
  before_action :set_sort_key, only: %i[my_patients]

  def my_patients
    @patients = @doctor.patients.order(@sort_key)
    render json: @patients
  end

  def assign_patient
    if @doctor.can_treat_patient?(@patient)
      @patient.assign_doctor(@doctor)
      render json: @doctor
    else
      render json: { error: "Cannot assign patient to doctor" }, status: :unprocessable_entity
    end
  end

  def available_patients
    @patients = @doctor.available_patients
    render json: @patients
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Doctor not found" }, status: :not_found
  end

  def set_patient
    @patient = Patient.find(params[:patient_id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Patient not found" }, status: :not_found
  end

  def set_sort_key
    if ['last_name', 'next_appointment'].include?(params[:sort])
      @sort_key = params[:sort]
    else
      @sort_key = 'last_name'
    end
  end
end
