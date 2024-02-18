class CreateIndications < ActiveRecord::Migration[7.1]
  def change
    create_table :indications do |t|
      t.string :name

      t.timestamps
    end
  end
end
