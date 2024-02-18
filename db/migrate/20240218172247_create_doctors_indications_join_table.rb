class CreateDoctorsIndicationsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :doctors, :indications do |t|
      # t.index [:doctor_id, :indication_id]
      # t.index [:indication_id, :doctor_id]
    end
  end
end
