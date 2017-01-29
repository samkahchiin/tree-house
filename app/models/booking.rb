class Booking < ActiveRecord::Base
  validates_presence_of :name, :mobile, :email, :no_of_adults, :trip_type, :price, :date, :backup_date_1, :backup_date_2
end
