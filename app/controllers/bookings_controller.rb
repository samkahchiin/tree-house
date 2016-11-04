class BookingsController < ApplicationController
  def new
    render :new
  end

  def create
    collection_id = ENV['COLLECTION_ID']
    # NOTE: This is a dummy amount. Remove it once you done the calculation function.
    amount = 100
    # NOTE: Set description to include datetime and amount of person or additional comments
    # after this
    # OR
    # Consider to utilize the booking model to store all the data
    description = 'Tree house booking'
    callback_url = 'www.example.com'
    extra_attributes = { description: description, collection_id: ENV['COLLECTION_ID'], amount: amount, callback_url: callback_url}
    bill_params = booking_params.merge extra_attributes

    bill = Billplz::Bill.new bill_params
    bill.create

    bill_id = bill.parsed_json['id']
    bill = Billplz::Bill.new({ bill_id: bill_id})
    bill = bill.get
    redirect_to bill['url']

    # Booking.create(booking_params)
  end

  private
  def booking_params
    params.require(:booking).permit(:name, :mobile, :email)
  end
end
