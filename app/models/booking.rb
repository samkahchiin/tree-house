class Booking < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :identification_no
  validates_presence_of :phone_no
  validates_presence_of :email
end
