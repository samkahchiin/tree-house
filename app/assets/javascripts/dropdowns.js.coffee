class ViewModel
  constructor: ->
    @noOfAdultsForMany      = ko.observable(0)
    @noOfKidsForMany        = ko.observable(0)

    @noOfAdultsForThree     = ko.observable(0)
    @noOfKidsForThree       = ko.observable(0)

    @noOfAdultsForTwo       = ko.observable(0)

    @noOfAdultsForThreeDays = ko.observable(0)
    @noOfKidsForThreeDays   = ko.observable(0)

    @optionsForMany  = [0..12]
    @optionsForThree = [0..3]
    @optionsForTwo   = [0..2]

    @availableDate = ko.observable()

    @price = ko.computed =>
      Number(@noOfAdultsForMany()) * 100 +
      Number(@noOfKidsForMany()) * 60 +
      Number(@noOfAdultsForThree()) * 110 +
      Number(@noOfKidsForThree()) * 60 +
      Number(@noOfAdultsForTwo()) * 130 +
      Number(@noOfAdultsForThreeDays()) * 180 +
      Number(@noOfKidsForThreeDays()) * 100

    @type = ko.computed =>
      type = []
      twoDays = [@noOfAdultsForMany(), @noOfKidsForMany(), @noOfAdultsForThree(), @noOfKidsForThree(), @noOfAdultsForTwo()]
      threeDays = [@noOfAdultsForThreeDays(), @noOfKidsForThreeDays()]

      if @sumOf(twoDays) > 0
        type.push("2D1N")
      else if @sumOf(threeDays) > 0
        type.push("3D2N")

      type.join(" & ")

    @canBook = ko.computed =>
      @price() != 0 && @availableDate()

  book: ->
    param = $.param @_buildParams()
    window.location.href = "bookings/new?#{param}"

  sumOf: (arr) ->
    arr = _.chain(arr)
          .map (elem) -> Number(elem)
          .sum()
          .value()

  _buildParams: ->
    noOfAdults = [@noOfAdultsForMany(), @noOfAdultsForThree(), @noOfAdultsForTwo(), @noOfAdultsForThreeDays()]
    noOfKids = [@noOfKidsForMany(), @noOfAdultsForThree(), @noOfKidsForThreeDays()]
    {
      price: @price()
      no_of_adults: @sumOf noOfAdults
      no_of_kids: @sumOf noOfKids
      type: @type()
      date: @availableDate()
    }

$(document).ready =>
  ko.applyBindings(new ViewModel())
