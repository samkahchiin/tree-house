class AddAttributesToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :no_of_adults, :integer
    change_column :bookings, :no_of_adults, :integer, null: false

    add_column :bookings, :no_of_kids, :integer

    add_column :bookings, :trip_type, :string
    change_column :bookings, :trip_type, :string, null: false

    add_column :bookings, :price, :integer
    change_column :bookings, :price, :integer, null: false

    add_column :bookings, :date, :date
    change_column :bookings, :date, :date, null: false

    add_column :bookings, :backup_date_1, :date
    change_column :bookings, :backup_date_1, :date, null: false

    add_column :bookings, :backup_date_2, :date
    change_column :bookings, :backup_date_2, :date, null: false

    add_column :bookings, :chosen_date, :date
  end
end
