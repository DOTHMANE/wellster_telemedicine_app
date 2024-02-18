# spec/requests/doctors_spec.rb

require 'rails_helper'

RSpec.describe "Doctors", type: :request do
  describe "GET /doctors/:id/my_patients" do
    let(:doctor) { create(:doctor) }

    it "returns a success response" do
      get "/doctors/#{doctor.id}/my_patients"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /doctors/:id/assign_patient" do
    let(:indication) { create(:indication) }
    let(:doctor) { create(:doctor) }
    let(:patient) { create(:patient, indication: indication, doctor: nil) }

    context "when the patient can be assigned" do
      before { doctor.indications << indication }

      it "assigns the patient to the doctor" do
        post "/doctors/#{doctor.id}/assign_patient", params: { patient_id: patient.id }
        expect(response).to have_http_status(:success)
        expect(patient.reload.doctor).to eq(doctor)
      end
    end

    context "when the patient cannot be assigned" do
      it "returns unprocessable_entity status" do
        allow_any_instance_of(Doctor).to receive(:can_treat_patient?).and_return(false)

        post "/doctors/#{doctor.id}/assign_patient", params: { patient_id: patient.id }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(patient.reload.doctor).to be_nil
      end
    end
  end

  describe "GET /doctors/:id/available_patients" do
    let(:doctor) { create(:doctor) }

    it "returns a success response" do
      get "/doctors/#{doctor.id}/available_patients"
      expect(response).to have_http_status(:success)
    end
  end
end
