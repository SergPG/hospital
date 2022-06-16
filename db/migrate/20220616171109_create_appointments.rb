class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :recommendation
      t.datetime :date_at
      t.string :status

      t.timestamps
    end
  end
end
