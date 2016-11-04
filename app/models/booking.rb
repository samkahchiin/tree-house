class Booking < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :identification_no
  validates_presence_of :phone_no
  validates_presence_of :email
end
