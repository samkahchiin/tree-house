class Booking < ActiveRecord::Base
  validates_presence_of :name, :mobile, :email
end
