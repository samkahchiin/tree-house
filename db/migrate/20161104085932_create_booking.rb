class CreateBooking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :identification_no, null: false
      t.string :phone_no, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
