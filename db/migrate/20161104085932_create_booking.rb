class CreateBooking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name, null: false
      t.string :mobile, null: false
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
