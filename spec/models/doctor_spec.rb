require 'rails_helper'

RSpec.describe Doctor, type: :model do

  describe "#can_treat_patient?" do
    let(:doctor) { create(:doctor) }
    let(:indication) { create(:indication) }
    let(:patient) { create(:patient, indication: indication, doctor: nil) }

    context "when patient is available and doctor can treat the patient's indication" do
      before { doctor.indications << indication }

      it "returns true" do
        expect(doctor.can_treat_patient?(patient)).to eq(true)
      end
    end

    context "when patient is not available" do
      before { allow(patient).to receive(:available?).and_return(false) }

      it "returns false" do
        expect(doctor.can_treat_patient?(patient)).to eq(false)
      end
    end

    context "when patient's indication does not match any of the doctor's indications" do
      it "returns false" do
        expect(doctor.can_treat_patient?(patient)).to eq(false)
      end
    end
  end

  describe "#assign_new_indication" do
    let(:doctor) { create(:doctor) }
    let(:indication) { create(:indication) }

    it "associates the new indication with the doctor" do
      doctor.assign_new_indication(indication)
      expect(doctor.indications).to include(indication)
    end
  end

  describe "#available_patients" do
    let(:doctor) { create(:doctor) }
    let(:indication) { create(:indication) }
    let!(:available_patient) { create(:patient, indication: indication, doctor: nil) }
    let!(:unavailable_patient) { create(:patient, indication: indication, doctor: doctor) }

    before { doctor.indications << indication }

    it "returns available patients with matching indications" do
      expect(doctor.available_patients).to include(available_patient)
      expect(doctor.available_patients).not_to include(unavailable_patient)
    end
  end
end