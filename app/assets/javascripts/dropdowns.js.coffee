class ViewModel
  constructor: ->
    @noOfAdultsForMany      = ko.observable()
    @noOfKidsForMany        = ko.observable()

    @noOfAdultsForThree     = ko.observable()
    @noOfKidsForThree       = ko.observable()

    @noOfAdultsForTwo       = ko.observable()

    @noOfAdultsForThreeDays = ko.observable()
    @noOfKidsForThreeDays   = ko.observable()

    @price = ko.computed =>
      Number(@noOfAdultsForMany()) * 100 +
      Number(@noOfKidsForMany()) * 60 +
      Number(@noOfAdultsForThree()) * 110 +
      Number(@noOfKidsForThree()) * 60 +
      Number(@noOfAdultsForTwo()) * 130 +
      Number(@noOfAdultsForThreeDays()) * 180 +
      Number(@noOfKidsForThreeDays()) * 100

$(document).ready =>
  ko.applyBindings(new ViewModel())
