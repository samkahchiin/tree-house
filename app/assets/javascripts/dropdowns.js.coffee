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
