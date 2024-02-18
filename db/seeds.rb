# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

diabetes = Indication.create(name: "Diabetes")
hair_loss = Indication.create(name: "Hair Loss")
cancer = Indication.create(name: "Cancer")

doctor1 = Doctor.create(name: "Dr. Smith")
doctor1.assign_new_indication(diabetes)
doctor1.assign_new_indication(hair_loss)

doctor2 = Doctor.create(name: "Dr. Johnson")
doctor2.assign_new_indication(hair_loss)

doctor3 = Doctor.create(name: "Dr. Marc")
doctor3.assign_new_indication(cancer)


patient1 = Patient.create(first_name: "patient a")
patient1.assign_indication(diabetes)

patient2 = Patient.create(first_name: "patient b")
patient2.assign_indication(hair_loss)

patient3 = Patient.create(first_name: "patient c")
patient3.assign_indication(cancer)