class PatientsController < ApplicationController
  def available_patients
    @patients = Patient.where(doctor_id: nil)
    render json: @patients
  end
end
