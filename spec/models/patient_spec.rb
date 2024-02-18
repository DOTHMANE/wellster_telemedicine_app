require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe "#assign_doctor" do
    let(:patient) { create(:patient) }
    let(:doctor) { create(:doctor) }

    it "assigns the doctor to the patient" do
      patient.assign_doctor(doctor)
      expect(patient.doctor).to eq(doctor)
    end
  end

  describe "#assign_indication" do
    let(:patient) { create(:patient) }
    let(:indication) { create(:indication) }

    it "assigns the indication to the patient" do
      patient.assign_indication(indication)
      expect(patient.indication).to eq(indication)
    end
  end

  describe "#assigned_patient?" do
    let(:patient) { create(:patient, doctor: doctor) }
    let(:doctor) { create(:doctor) }

    context "when patient is assigned to a doctor" do
      it "returns true" do
        expect(patient.assigned_patient?).to eq(true)
      end
    end

    context "when patient is not assigned to a doctor" do
      let(:patient) { create(:patient, doctor: nil) }

      it "returns false" do
        expect(patient.assigned_patient?).to eq(false)
      end
    end
  end

  describe "#available?" do
    let(:patient) { create(:patient, doctor: nil) }
    let(:doctor) { create(:doctor) }

    context "when patient is not assigned to a doctor" do
      it "returns true" do
        expect(patient.available?).to eq(true)
      end
    end

    context "when patient is assigned to a doctor" do
      let(:patient) { create(:patient, doctor: doctor) }

      it "returns false" do
        expect(patient.available?).to eq(false)
      end
    end
  end
end