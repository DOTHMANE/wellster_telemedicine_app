class Patient < ApplicationRecord
  belongs_to :doctor, optional: true
  belongs_to :indication, optional: true


  def assign_doctor(doctor)
    update(doctor: doctor)
  end

  def assign_indication(indication)
    update(indication: indication)
  end

  def assigned_patient?
    doctor.present?
  end

  def available?
    doctor.nil?
  end
end
