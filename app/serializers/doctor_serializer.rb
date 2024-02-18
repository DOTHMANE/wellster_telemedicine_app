class DoctorSerializer < ActiveModel::Serializer
  attributes :name
  has_many :patients
  has_many :indications
end
