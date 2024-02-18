class PatientSerializer < ActiveModel::Serializer
  attributes :first_name, :next_appointment
  belongs_to :indication
end
