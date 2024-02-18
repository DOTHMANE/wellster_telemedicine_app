class Doctor < ApplicationRecord
  has_many :patients
  has_and_belongs_to_many :indications

  def can_treat_patient?(patient)
    patient.available? && indications.ids.include?(patient.indication.id)
  end

  def assign_new_indication(new_indication)
    indications << new_indication
  end

  def available_patients
    Patient.where(doctor_id: nil, indication_id: indications.ids)
  end
end




