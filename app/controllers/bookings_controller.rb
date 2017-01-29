class BookingsController < ApplicationController
  def new
    @no_of_adults = params[:no_of_adults]
    @no_of_kids   = params[:no_of_kids]
    @trip_type    = params[:trip_type]
    @price        = params[:price]
    @date         = params[:date]
    render :new
  end

  def create
    collection_id = ENV['COLLECTION_ID']

    date         = params[:date]
    no_of_kids   = params[:no_of_kids]
    no_of_adults = params[:no_of_adults]
    type         = params[:type]

    description = "Tree house booking on #{date} for #{no_of_adults} adult(s) and #{no_of_kids} kid(s) for #{type}"
    callback_url = request.base_url

    # TODO: Refactor this and ways to write description
    bill_params = { name: params[:name],
                    mobile: params[:mobile],
                    email: params[:email],
                    description: description,
                    collection_id: ENV['COLLECTION_ID'],
                    callback_url: callback_url,
                    amount: params[:price]
                  }

    @bill = Billplz::Bill.new bill_params
    @bill.create
    if @bill.success?
      get_bill
      # NOTE: redirect to the bill page to make payment
      if Booking.create modified_booking_params
        redirect_to @successful_bil['url'] 
      else
        redirect_to new_booking_path, alert: 'Something is wrong. Please fill in the form with correct information.'
      end
    else
      redirect_to new_booking_path, alert: 'Something is wrong. Please fill in the form with correct information.'
    end
    # TODO: redirect_to new booking page
    # TODO: Fetch the error message from bill
  end

  def get_bill
    bill_id = @bill.parsed_json['id']
    bill = Billplz::Bill.new({ bill_id: bill_id})
    @successful_bil = bill.get
  end

  private

  def booking_params
    params.permit(:name, :mobile, :email, :no_of_adults, :no_of_kids, :trip_type, :price, :date, :backup_date_1, :backup_date_2, :chosen_date)
  end

  def modified_booking_params
    date_params = [ "date", "backup_date_1", "backup_date_2" ]
    modified_booking_params = booking_params
    date_params.each do |key|
      val = modified_booking_params[key]
      modified_booking_params[key] = Date.parse(val) if val
    end
    modified_booking_params
  end

  def success_booking?
    # Confirm how many rooms are available per day
    # Validation on model side and client side
    # how many children and adult are allowed per house
    # Render error message if the booking is failing
    #
    # Form side:
    # Added dropdown for house
    # Added dropdown for children
    #
  end
end
