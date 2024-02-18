class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :next_appointment
      t.references :doctor, foreign_key: true
      t.references :indication, foreign_key: true

      t.timestamps
    end
  end
end
