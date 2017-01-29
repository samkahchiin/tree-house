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
    trip_type    = params[:trip_type]

    description = "#{date} - #{trip_type}: #{no_of_adults} adult(s) and #{no_of_kids} kid(s)"
    callback_url = request.base_url

    # TODO: Refactor this and ways to write description
    bill_params = { name: params[:name],
                    mobile: params[:mobile],
                    email: params[:email],
                    description: description,
                    collection_id: ENV['COLLECTION_ID'],
                    callback_url: callback_url,
                    amount: params[:price].to_i * 100
                  }

    @bill = Billplz::Bill.new bill_params
    @bill.create
    if @bill.success?
      get_bill
      # NOTE: redirect to the bill page to make payment
      if Booking.create booking_params
        redirect_to @successful_bil['url']
      else
        redirect_to new_booking_path, alert: 'Something is wrong. Please fill in the form with correct information.'
      end
    else
      error_message = JSON.parse(@bill.response.body)["error"]["message"].join(" ")
      flash[:alert] = error_message
      redirect_to new_booking_path
    end
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
