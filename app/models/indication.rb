class Indication < ApplicationRecord
  has_and_belongs_to_many :doctors
  has_many :patients
end
